#!/usr/bin/env python3
"""Compare CIR and OG LLVM IR dumps produced by dump_ir.sh.

The parser is deliberately dependency-free and reports the differences that
matter for this investigation: instruction mix, kernel pointer address spaces,
function attributes, named metadata, and the -O3 pass-manager trace.
"""

import argparse
import collections
import math
import pathlib
import re
import sys


SKIP_PREFIXES = (
    "define ", "declare ", "attributes ", "target ", "source_filename",
    "module asm", "uselistorder", "comdat ", "$",
)
INSTRUCTION_PREFIXES = {"tail", "musttail", "notail"}
FUNCTION_RE = re.compile(
    r"^define\s+(?P<prefix>.*?)@(?P<name>\"[^\"]+\"|[-$._A-Za-z0-9]+)"
    r"\((?P<args>.*?)\)\s*[^\{]*\{",
    re.MULTILINE | re.DOTALL,
)
PTR_AS_RE = re.compile(r"\bptr(?:\s+addrspace\((\d+)\))?")
NAMED_METADATA_RE = re.compile(r"^!(?P<name>[A-Za-z0-9_.]+)\s*=", re.MULTILINE)
ATTR_RE = re.compile(r"^attributes\s+#\d+\s*=\s*\{(?P<value>.*)\}$", re.MULTILINE)
PASS_RE = re.compile(r"Running pass:\s+([^\n]+?)(?:\s+on\s+.*)?$")


def read(path):
    return path.read_text(encoding="utf-8", errors="replace")


def instructions(text):
    counts = collections.Counter()
    for raw in text.splitlines():
        line = raw.strip()
        if not line or line.startswith((";", "!")) or line.endswith(":"):
            continue
        if line.startswith(SKIP_PREFIXES):
            continue
        rhs = line.split("=", 1)[1].strip() if "=" in line else line
        tokens = rhs.split()
        if not tokens:
            continue
        while tokens and tokens[0] in INSTRUCTION_PREFIXES:
            tokens.pop(0)
        if not tokens:
            continue
        opcode = tokens[0]
        if re.fullmatch(r"[a-z][A-Za-z0-9_.]*", opcode):
            counts[opcode] += 1
    return counts


def signatures(text):
    result = {}
    for match in FUNCTION_RE.finditer(text):
        name = match.group("name")
        prefix = " ".join(match.group("prefix").split())
        args = " ".join(match.group("args").split())
        ptr_as = [address_space or "0" for address_space in PTR_AS_RE.findall(args)]
        result[name] = {"prefix": prefix, "args": args, "ptr_as": ptr_as}
    return result


def named_metadata(text):
    return set(NAMED_METADATA_RE.findall(text))


def attribute_groups(text):
    return {" ".join(value.split()) for value in ATTR_RE.findall(text)}


def pass_names(text):
    return collections.Counter(PASS_RE.findall(text))


def percent_delta(cir, og):
    if og == 0:
        return "n/a"
    return f"{(cir / og - 1) * 100:+.1f}%"


def instruction_report(pairs, stage):
    rows = []
    cir_total = og_total = 0
    cir_opcodes = collections.Counter()
    og_opcodes = collections.Counter()
    for name, cir_path, og_path in pairs:
        cir_counts = instructions(read(cir_path))
        og_counts = instructions(read(og_path))
        cir = sum(cir_counts.values())
        og = sum(og_counts.values())
        rows.append((name, cir, og))
        cir_total += cir
        og_total += og
        cir_opcodes.update(cir_counts)
        og_opcodes.update(og_counts)

    lines = [f"## {stage} instruction counts", "",
             "| Translation unit | CIR | OG | CIR vs OG |",
             "|---|---:|---:|---:|"]
    for name, cir, og in sorted(rows):
        lines.append(f"| {name} | {cir} | {og} | {percent_delta(cir, og)} |")
    lines.append(f"| **Total** | **{cir_total}** | **{og_total}** | **{percent_delta(cir_total, og_total)}** |")

    movers = []
    for opcode in set(cir_opcodes) | set(og_opcodes):
        delta = cir_opcodes[opcode] - og_opcodes[opcode]
        if delta:
            movers.append((abs(delta), opcode, cir_opcodes[opcode], og_opcodes[opcode]))
    lines.extend(["", "Largest aggregate opcode deltas (CIR - OG):", "",
                  "| Opcode | CIR | OG | Delta |", "|---|---:|---:|---:|"])
    for _, opcode, cir, og in sorted(movers, reverse=True)[:20]:
        lines.append(f"| `{opcode}` | {cir} | {og} | {cir - og:+d} |")
    return "\n".join(lines)


def signature_report(pairs):
    diffs = []
    for unit, cir_path, og_path in pairs:
        cir = signatures(read(cir_path))
        og = signatures(read(og_path))
        for name in sorted(set(cir) & set(og)):
            if cir[name]["ptr_as"] != og[name]["ptr_as"] or cir[name]["args"] != og[name]["args"]:
                diffs.append((unit, name, ", ".join(cir[name]["ptr_as"]) or "-",
                              ", ".join(og[name]["ptr_as"]) or "-",
                              cir[name]["args"], og[name]["args"]))

    lines = ["## O0 function-signature differences", "",
             "The pointer-AS columns list pointer arguments in declaration order; `0` is generic. "
             "This directly exposes missing kernel-pointer coercions.", ""]
    if not diffs:
        return "\n".join(lines + ["No shared function signatures differ."])
    lines.extend(["| Translation unit | Function | CIR pointer AS | OG pointer AS |",
                  "|---|---|---|---|"])
    for unit, name, cir_as, og_as, _, _ in diffs:
        lines.append(f"| {unit} | `{name}` | {cir_as} | {og_as} |")
    lines.extend(["", "Full differing argument lists:", ""])
    for unit, name, _, _, cir_args, og_args in diffs:
        lines.extend([f"- `{unit}` / `{name}`", f"  - CIR: `{cir_args}`", f"  - OG: `{og_args}`"])
    return "\n".join(lines)


def module_report(pairs):
    cir_metadata = set()
    og_metadata = set()
    cir_attrs = set()
    og_attrs = set()
    for _, cir_path, og_path in pairs:
        cir_text = read(cir_path)
        og_text = read(og_path)
        cir_metadata.update(named_metadata(cir_text))
        og_metadata.update(named_metadata(og_text))
        cir_attrs.update(attribute_groups(cir_text))
        og_attrs.update(attribute_groups(og_text))

    lines = ["## O0 module-level differences", "",
             "Named metadata only in CIR:", ""]
    lines.extend([f"- `{name}`" for name in sorted(cir_metadata - og_metadata)] or ["- none"])
    lines.extend(["", "Named metadata only in OG:", ""])
    lines.extend([f"- `{name}`" for name in sorted(og_metadata - cir_metadata)] or ["- none"])
    lines.extend(["", f"Distinct attribute groups: CIR={len(cir_attrs)}, OG={len(og_attrs)}.",
                  "Attribute groups only in CIR:", ""])
    lines.extend([f"- `{attr}`" for attr in sorted(cir_attrs - og_attrs)[:20]] or ["- none"])
    lines.extend(["", "Attribute groups only in OG:", ""])
    lines.extend([f"- `{attr}`" for attr in sorted(og_attrs - cir_attrs)[:20]] or ["- none"])
    return "\n".join(lines)


def pass_report(root):
    logs = sorted((root / "logs").glob("*.O3.log"))
    cir = collections.Counter()
    og = collections.Counter()
    for path in logs:
        target = cir if ".cir." in path.name else og if ".og." in path.name else None
        if target is not None:
            target.update(pass_names(read(path)))
    lines = ["## O3 pass-manager comparison", ""]
    if not logs:
        return "\n".join(lines + ["No O3 pass logs found."])
    lines.append(f"Pass executions observed: CIR={sum(cir.values())}, OG={sum(og.values())}.")
    lines.extend(["", "Passes observed only in CIR:", ""])
    lines.extend([f"- `{name}` ({cir[name]} execution(s))" for name in sorted(set(cir) - set(og))] or ["- none"])
    lines.extend(["", "Passes observed only in OG:", ""])
    lines.extend([f"- `{name}` ({og[name]} execution(s))" for name in sorted(set(og) - set(cir))] or ["- none"])
    return "\n".join(lines)


def collect_pairs(root, stage):
    pairs = []
    for cir_path in sorted((root / "device").glob(f"*.cir.{stage}.ll")):
        og_path = cir_path.with_name(cir_path.name.replace(".cir.", ".og."))
        if og_path.exists():
            unit = cir_path.name.replace(f".cir.{stage}.ll", "")
            pairs.append((unit, cir_path, og_path))
    return pairs


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("ir_root", type=pathlib.Path,
                        help="directory created by dump_ir.sh")
    parser.add_argument("--output", type=pathlib.Path,
                        help="write Markdown report here instead of stdout")
    args = parser.parse_args()

    root = args.ir_root
    o0_pairs = collect_pairs(root, "O0")
    o3_pairs = collect_pairs(root, "O3")
    if not o0_pairs or not o3_pairs:
        sys.exit("Expected matching device/*.cir.O0.ll, *.og.O0.ll, *.cir.O3.ll, and *.og.O3.ll files.")

    report = ["# CIR vs OG LLVM IR comparison", ""]
    manifest = root / "manifest.txt"
    if manifest.exists():
        report.extend(["```text", read(manifest).rstrip(), "```", ""])
    report.extend([instruction_report(o0_pairs, "O0"), "", instruction_report(o3_pairs, "O3"), "",
                   signature_report(o0_pairs), "", module_report(o0_pairs), "", pass_report(root), ""])
    text = "\n".join(report)
    if args.output:
        args.output.write_text(text, encoding="utf-8")
    else:
        print(text)


if __name__ == "__main__":
    main()
