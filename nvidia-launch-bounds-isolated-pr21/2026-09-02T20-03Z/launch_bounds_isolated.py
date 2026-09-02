#!/usr/bin/env python3
"""Isolated PolyBench launch-bounds A/B on PR25.

Both arms use --clangir-offload-merge. LB-off adds
-fno-cir-infer-launch-bounds; LB-on adds the explicit positive flag.
Compilation captures ptxas -v, cuobjdump resource/SASS output, validation, and
paired alternating runtime samples.
"""
from __future__ import annotations

import argparse
import concurrent.futures
import hashlib
import json
import math
import os
import random
import statistics
import subprocess
import sys
import time
from datetime import datetime, timezone
from pathlib import Path


def run(cmd, *, timeout=600, env=None):
    return subprocess.run(cmd, text=True, capture_output=True, timeout=timeout, env=env)


def snapshot_gpu():
    cmd = ["nvidia-smi", "--query-gpu=timestamp,name,driver_version,temperature.gpu,power.draw,clocks.sm,clocks.mem,utilization.gpu", "--format=csv,noheader,nounits"]
    p = run(cmd, timeout=30)
    return p.stdout.strip() if p.returncode == 0 else f"ERROR: {p.stderr.strip()}"


def ci_bootstrap(values, *, reps=10000, seed=21):
    if not values:
        return [None, None]
    if len(values) == 1:
        return [values[0], values[0]]
    rng = random.Random(seed)
    boots = []
    for _ in range(reps):
        sample = [values[rng.randrange(len(values))] for _ in values]
        boots.append(math.exp(sum(math.log(x) for x in sample) / len(sample)))
    boots.sort()
    return [boots[int(0.025 * reps)], boots[int(0.975 * reps)]]


def geomean(xs):
    return math.exp(sum(math.log(x) for x in xs) / len(xs)) if xs else float("nan")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--clang", type=Path, required=True)
    ap.add_argument("--root", type=Path, required=True)
    ap.add_argument("--audit", type=Path, required=True)
    ap.add_argument("--out", type=Path, required=True)
    ap.add_argument("--arch", default="sm_86")
    ap.add_argument("--runs", type=int, default=20)
    ap.add_argument("--warmup", type=int, default=5)
    ap.add_argument("--jobs", type=int, default=4)
    ap.add_argument("--limit", type=int, default=0)
    args = ap.parse_args()

    args.out.mkdir(parents=True, exist_ok=True)
    sys.path.insert(0, str(args.audit))
    import run_runtime as rr
    from polybench_common import benchmark_name, is_hip, git_rev, provenance

    files = sorted(
        (f for f in args.root.rglob("*.cu")
         if ".ipynb_checkpoints" not in f.parts
         and "polybenchCodesCudaOpenClHMPPOpenAcc" not in f.parts),
        key=lambda p: p.name,
    )
    if args.limit:
        files = files[:args.limit]
    common = args.root / "common"
    gcc = Path("/usr/lib/gcc/x86_64-linux-gnu/11")
    cuda = Path("/usr/local/cuda")
    dummy_hip = Path("/opt/rocm")
    dummy_rocm_lib = Path("/opt/rocm/amdgcn/bitcode")

    builds = {a: args.out / "build" / a for a in ("LB-off", "LB-on")}
    logs = {a: args.out / "compile-logs" / a for a in ("LB-off", "LB-on")}
    for d in [*builds.values(), *logs.values(), args.out / "resources", args.out / "sass", args.out / "validation"]:
        d.mkdir(parents=True, exist_ok=True)

    pb_dir = args.out / "polybench-objects"
    pb_dir.mkdir(exist_ok=True)
    pb_objs = rr._compile_polybench_objs(args.clang, common, gcc, pb_dir)

    arm_flags = {
        "LB-off": "-fno-cir-infer-launch-bounds -Xcuda-ptxas -v",
        "LB-on":  "-fcir-infer-launch-bounds -Xcuda-ptxas -v",
    }

    def compile_job(file, arm, validate=False):
        build = builds[arm] if not validate else args.out / "validation" / arm
        logdir = logs[arm] if not validate else args.out / "validation" / arm / "logs"
        build.mkdir(parents=True, exist_ok=True)
        logdir.mkdir(parents=True, exist_ok=True)
        r = rr.compile_one(
            args.clang, args.root, cuda, dummy_hip, dummy_rocm_lib, gcc,
            args.arch, "CIR-merge", file, common, pb_objs, build, logdir,
            no_cpu_ref=not validate, clang_flags=arm_flags[arm],
        )
        r.pipeline = arm
        return r

    records = {}
    jobs = [(f, a) for f in files for a in ("LB-off", "LB-on")]
    print(f"Compiling {len(jobs)} timing binaries with -j{args.jobs}", flush=True)
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.jobs) as ex:
        futs = {ex.submit(compile_job, f, a, False): (f, a) for f, a in jobs}
        for i, fut in enumerate(concurrent.futures.as_completed(futs), 1):
            f, a = futs[fut]
            r = fut.result()
            records[(f, a)] = r
            print(f"compile {i}/{len(jobs)} {a} {benchmark_name(f)} {'OK' if r.compile_ok else 'FAIL'}", flush=True)

    # Tool evidence for every successfully built timing binary.
    resources = {}
    for f, arm in jobs:
        r = records[(f, arm)]
        if not r.compile_ok or not r.binary:
            continue
        key = f"{benchmark_name(f)}.{arm}"
        for option, subdir, suffix in [
            ("--dump-resource-usage", "resources", ".txt"),
            ("--dump-sass", "sass", ".sass"),
        ]:
            p = run(["cuobjdump", option, str(r.binary)], timeout=300)
            outpath = args.out / subdir / (key + suffix)
            outpath.write_text(p.stdout + ("\nSTDERR:\n" + p.stderr if p.stderr else ""))
            if option == "--dump-resource-usage":
                resources[(f, arm)] = p.stdout

    print(f"Running paired A/B: {args.warmup} warmups/arm + {args.runs} pairs", flush=True)
    sample_records = {}
    gpu_snapshots = [snapshot_gpu()]
    for fi, f in enumerate(files, 1):
        if not all(records[(f, a)].compile_ok for a in ("LB-off", "LB-on")):
            continue
        binaries = {a: records[(f, a)].binary for a in ("LB-off", "LB-on")}
        for w in range(args.warmup):
            order = ("LB-off", "LB-on") if w % 2 == 0 else ("LB-on", "LB-off")
            for arm in order:
                run([str(binaries[arm])], timeout=600)
        samples = {a: [] for a in ("LB-off", "LB-on")}
        walls = {a: [] for a in ("LB-off", "LB-on")}
        pairs = []
        for i in range(args.runs):
            order = ("LB-off", "LB-on") if i % 2 == 0 else ("LB-on", "LB-off")
            pair = {}
            for arm in order:
                start = time.perf_counter()
                p = run([str(binaries[arm])], timeout=600)
                wall = time.perf_counter() - start
                t = rr._parse_time(p.stdout) if p.returncode == 0 else None
                if t is None:
                    raise RuntimeError(f"missing timing: {benchmark_name(f)} {arm} rc={p.returncode}\n{p.stdout}\n{p.stderr}")
                samples[arm].append(t)
                walls[arm].append(wall)
                pair[arm] = t
            pairs.append({"off": pair["LB-off"], "on": pair["LB-on"], "ratio": pair["LB-on"] / pair["LB-off"]})
        ratios = [x["ratio"] for x in pairs]
        point = geomean(ratios)
        lo, hi = ci_bootstrap(ratios, seed=21 + fi)
        sample_records[f] = {"times": samples, "wall_times": walls, "pairs": pairs,
                             "ratio_geomean": point, "ratio_ci95": [lo, hi]}
        print(f"run {fi}/{len(files)} {benchmark_name(f)} on/off={point:.5f} CI=[{lo:.5f},{hi:.5f}]", flush=True)
        gpu_snapshots.append(snapshot_gpu())

    # Correctness binaries and one execution each.
    print(f"Validating {len(jobs)} binaries", flush=True)
    validations = {}
    with concurrent.futures.ThreadPoolExecutor(max_workers=args.jobs) as ex:
        futs = {ex.submit(compile_job, f, a, True): (f, a) for f, a in jobs}
        for i, fut in enumerate(concurrent.futures.as_completed(futs), 1):
            f, arm = futs[fut]
            r = fut.result()
            item = {"compile_ok": r.compile_ok, "misses": None, "status": "compile_failed"}
            if r.compile_ok and r.binary:
                p = run([str(r.binary)], timeout=900)
                misses = rr._parse_validation_misses(p.stdout) if p.returncode == 0 else None
                item = {"compile_ok": True, "misses": misses,
                        "status": "passed" if misses == 0 else ("mismatches" if misses is not None else "exec_failed"),
                        "returncode": p.returncode}
            validations[(f, arm)] = item
            print(f"validate {i}/{len(jobs)} {arm} {benchmark_name(f)} {item['status']} misses={item['misses']}", flush=True)

    result_rows = []
    benchmark_ratios = []
    for f in files:
        s = sample_records.get(f)
        if s:
            benchmark_ratios.append(s["ratio_geomean"])
        row = {"benchmark": benchmark_name(f), "file": str(f), "samples": s, "arms": {}}
        for arm in ("LB-off", "LB-on"):
            r = records[(f, arm)]
            raw = r.binary.read_bytes() if r.compile_ok and r.binary else b""
            row["arms"][arm] = {
                "compile_ok": r.compile_ok,
                "binary": str(r.binary) if r.binary else None,
                "binary_bytes": len(raw) if raw else None,
                "sha256": hashlib.sha256(raw).hexdigest() if raw else None,
                "compile_log": str(r.compile_log),
                "validation": validations.get((f, arm)),
                "resource_usage": resources.get((f, arm), ""),
            }
        result_rows.append(row)

    suite_gm = geomean(benchmark_ratios)
    suite_ci = ci_bootstrap(benchmark_ratios, seed=2100)
    payload = {
        "schema": 1,
        "kind": "launch-bounds-isolated",
        "timestamp_utc": datetime.now(timezone.utc).isoformat(),
        "method": {
            "arms": {"LB-off": "--clangir-offload-merge -fno-cir-infer-launch-bounds",
                     "LB-on": "--clangir-offload-merge -fcir-infer-launch-bounds"},
            "warmup_per_arm": args.warmup, "paired_runs": args.runs,
            "execution_order": "alternating per pair", "jobs_compile": args.jobs,
            "runtime_jobs": 1, "ptxas": "-v", "arch": args.arch,
        },
        "commits": {"llvm": git_rev(args.clang.parent.parent.parent),
                    "audit": git_rev(args.audit), "polybench": git_rev(args.root)},
        "environment": provenance(),
        "gpu_snapshots": gpu_snapshots,
        "suite_ratio_on_over_off_geomean": suite_gm,
        "suite_ratio_ci95_benchmark_bootstrap": suite_ci,
        "results": result_rows,
    }
    (args.out / "launch_bounds_results.json").write_text(json.dumps(payload, indent=2) + "\n")

    lines = [
        "# Isolated launch-bounds experiment", "",
        f"- LLVM: `{payload['commits']['llvm']}`", f"- PolyBench: `{payload['commits']['polybench']}`",
        f"- arch: `{args.arch}`", f"- samples: {args.runs} paired + {args.warmup} warmups/arm", "",
        "Both arms use `--clangir-offload-merge`; only `-f[no-]cir-infer-launch-bounds` differs.", "",
        "| Benchmark | LB-off median (s) | LB-on median (s) | on/off paired gmean | 95% paired bootstrap CI | verdict |",
        "|---|---:|---:|---:|---:|---|",
    ]
    for f in files:
        s = sample_records.get(f)
        if not s:
            lines.append(f"| {benchmark_name(f)} | — | — | — | — | failed |")
            continue
        off = statistics.median(s["times"]["LB-off"]); on = statistics.median(s["times"]["LB-on"])
        ratio = s["ratio_geomean"]; lo, hi = s["ratio_ci95"]
        verdict = "speedup" if hi < 1.0 else ("slowdown" if lo > 1.0 else "inconclusive")
        lines.append(f"| {benchmark_name(f)} | {off:.6f} | {on:.6f} | {ratio:.5f} | [{lo:.5f}, {hi:.5f}] | {verdict} |")
    lines += ["", f"**Suite LB-on/LB-off geomean:** `{suite_gm:.5f}`",
              f"**95% benchmark-bootstrap CI:** `[{suite_ci[0]:.5f}, {suite_ci[1]:.5f}]`", "",
              "Raw ptxas logs, cuobjdump resource usage, SASS, binaries, validation, and samples are preserved alongside this report."]
    (args.out / "launch_bounds_summary.md").write_text("\n".join(lines) + "\n")
    print("DONE", args.out, "suite", suite_gm, suite_ci, flush=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
