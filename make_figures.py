#!/usr/bin/env python3
"""Paper-ready figures: CIR vs OG overhead on PolyBench/GPU (CUDA & HIP).

Reads the single-arch result JSONs from the latest runs and produces:
  figures/fig1_runtime_ratio.{pdf,png}   per-benchmark runtime CIR/OG ratio
  figures/fig2_compile_ratio.{pdf,png}   per-benchmark compile-time CIR/OG ratio
  figures/fig3_phase_breakdown.{pdf,png} stacked compile-phase breakdown
  figures/fig4_runtime_scatter.{pdf,png} CIR vs OG runtime log-log scatter

Requires: matplotlib, numpy.
"""

import json
import math
import os
import statistics

import matplotlib.pyplot as plt
import numpy as np

ROOT = os.path.dirname(os.path.abspath(__file__))
H100_DIR = os.path.join(ROOT, "nvidia-h100", "2026-08-05T14-15Z")
MI300X_DIR = os.path.join(ROOT, "amd-mi300x", "2026-08-05T14-57Z")
OUT_DIR = os.path.join(ROOT, "figures")

RUNTIME_JSON = {
    "h100": os.path.join(H100_DIR, "runtime-cuda-sm_90-j1__runtime_results.json"),
    "mi300x": os.path.join(MI300X_DIR, "runtime-hip-gfx942-j1__runtime_results.json"),
}
COMPILE_JSON = {
    "h100": os.path.join(H100_DIR, "compile-cuda-sm_90-j1__compile_results.json"),
    "mi300x": os.path.join(MI300X_DIR, "compile-hip-gfx942-j1__compile_results.json"),
}

PLATFORM_LABEL = {
    "h100": "NVIDIA H100 (CUDA, sm_90)",
    "mi300x": "AMD MI300X (HIP, gfx942)",
}
PLATFORM_COLOR = {"h100": "#0072B2", "mi300x": "#D55E00"}

plt.rcParams.update({
    "font.size": 9,
    "axes.titlesize": 9.5,
    "axes.labelsize": 9,
    "xtick.labelsize": 8.5,
    "ytick.labelsize": 8.5,
    "legend.fontsize": 8.5,
    "axes.grid": True,
    "grid.alpha": 0.3,
    "grid.linewidth": 0.5,
    "axes.axisbelow": True,
    "figure.dpi": 300,
    "savefig.bbox": "tight",
})


def load(path):
    with open(path) as f:
        return json.load(f)


def pairs_runtime(path):
    """Return {benchmark: (cir_samples, og_samples)} for successful runs."""
    d = load(path)
    res = [r for r in d["results"] if r.get("compile_ok") and r.get("times")]
    cir = {r["benchmark"]: r["times"] for r in res if r["pipeline"] == "CIR"}
    og = {r["benchmark"]: r["times"] for r in res if r["pipeline"] == "OG"}
    return {b: (cir[b], og[b]) for b in cir if b in og}


def pairs_compile(path):
    """Return {benchmark: (cir_entry, og_entry)} for successful compilations."""
    d = load(path)
    res = [r for r in d["results"] if r["ok"]]
    cir = {r["benchmark"]: r for r in res if r["pipeline"] == "CIR"}
    og = {r["benchmark"]: r for r in res if r["pipeline"] == "OG"}
    return {b: (cir[b], og[b]) for b in cir if b in og}


def geomean(xs):
    return math.exp(sum(math.log(x) for x in xs) / len(xs))


def save(fig, name):
    os.makedirs(OUT_DIR, exist_ok=True)
    for ext in ("pdf", "png"):
        fig.savefig(os.path.join(OUT_DIR, f"{name}.{ext}"))
    plt.close(fig)
    print(f"wrote figures/{name}.pdf/.png")


# ---------------------------------------------------------------- Fig 1: runtime ratio
def fig1():
    fig, axes = plt.subplots(1, 2, figsize=(7.0, 4.6))
    for ax, plat in zip(axes, ("h100", "mi300x")):
        data = pairs_runtime(RUNTIME_JSON[plat])
        rows = []
        for b, (cs, os_) in data.items():
            ratio = statistics.mean(cs) / statistics.mean(os_)
            rows.append((b, ratio))
        rows.sort(key=lambda x: x[1])
        names = [r[0] for r in rows]
        ratios = [r[1] for r in rows]
        gm = geomean(ratios)

        y = np.arange(len(rows))
        ax.barh(y, ratios, height=0.7, color=PLATFORM_COLOR[plat], alpha=0.85)
        ax.axvline(1.0, color="black", lw=1.0)
        ax.set_yticks(y, names)
        ax.set_xscale("log")
        ax.set_xlabel("Runtime ratio CIR/OG (log scale)")
        ax.set_title(f"({'ab'[plat == 'mi300x']}) {PLATFORM_LABEL[plat]}")
        ax.text(0.97, 0.03, f"geomean = {gm:.3f}", transform=ax.transAxes,
                ha="right", va="bottom", fontsize=8.5, color="0.2",
                bbox=dict(facecolor="white", edgecolor="none", alpha=0.85,
                          pad=1.2))
        ax.grid(axis="y", visible=False)
        if plat == "h100":
            ax.set_xlim(0.96, 1.025)
            ticks = [0.96, 0.98, 1.0, 1.02]
        else:
            ax.set_xlim(0.9, 25)
            ticks = [1, 2, 5, 10, 20]
        ax.set_xticks(ticks, [f"{t:g}" for t in ticks])
        ax.minorticks_off()
    fig.tight_layout()
    save(fig, "fig1_runtime_ratio")


# ---------------------------------------------------------------- Fig 2: compile ratio
def fig2():
    fig, axes = plt.subplots(1, 2, figsize=(7.0, 4.6))
    for ax, plat in zip(axes, ("h100", "mi300x")):
        data = pairs_compile(COMPILE_JSON[plat])
        rows = []
        for b, (c, o) in data.items():
            # paired per-sample ratios -> mean and spread
            sample_ratios = [cs / os_ for cs, os_ in
                             zip(c["elapsed_samples"], o["elapsed_samples"])]
            rows.append((b, statistics.mean(sample_ratios),
                         statistics.stdev(sample_ratios)))
        rows.sort(key=lambda x: x[1])
        names = [r[0] for r in rows]
        means = np.array([r[1] for r in rows])
        stds = np.array([r[2] for r in rows])
        gm = geomean(list(means))

        y = np.arange(len(rows))
        ax.barh(y, means, height=0.7, color=PLATFORM_COLOR[plat], alpha=0.85,
                xerr=stds, error_kw=dict(lw=0.7, capsize=1.5, ecolor="0.25"))
        ax.axvline(1.0, color="black", lw=1.0)
        ax.set_yticks(y, names)
        ax.set_xlabel("Compile-time ratio CIR/OG (wall, mean ± 1σ)")
        ax.set_title(f"({'ab'[plat == 'mi300x']}) {PLATFORM_LABEL[plat]}")
        ax.text(0.97, 0.03, f"geomean = {gm:.4f}", transform=ax.transAxes,
                ha="right", va="bottom", fontsize=8.5, color="0.2",
                bbox=dict(facecolor="white", edgecolor="none", alpha=0.85,
                          pad=1.2))
        ax.set_xlim(0.98, 1.065)
        ax.grid(axis="y", visible=False)
    fig.tight_layout()
    save(fig, "fig2_compile_ratio")


# ---------------------------------------------------------------- Fig 3: phase breakdown
def fig3():
    # (segment label, phase key or None for remainder, color)
    segments = [
        ("Frontend+IRGen", "Frontend+IRGen", "#4C72B0"),
        ("LLVM passes", "LLVM-passes", "#DD8452"),
        ("Backend (ISel/analysis/RA)", None, "#55A868"),  # sum of small phases
        ("Other (unattributed)", "other", "#C4C4C4"),
    ]
    small_phases = ("ISel", "LLVM-analysis", "RegAlloc")

    fig, ax = plt.subplots(figsize=(5.8, 3.0))
    xpos, xticks, xticklabels = [], [], []
    x = 0.0
    for plat in ("h100", "mi300x"):
        data = pairs_compile(COMPILE_JSON[plat])
        for pipe in ("OG", "CIR"):
            entries = [e for pair in data.values() for e in pair
                       if e["pipeline"] == pipe]
            tot = statistics.mean(e["elapsed_mean"] for e in entries)
            fe = statistics.mean(e["phases_mean"].get("Frontend+IRGen", 0)
                                 for e in entries)
            lp = statistics.mean(e["phases_mean"].get("LLVM-passes", 0)
                                 for e in entries)
            be = sum(statistics.mean(e["phases_mean"].get(p, 0)
                                     for e in entries) for p in small_phases)
            vals = {"Frontend+IRGen": fe, "LLVM-passes": lp, None: be,
                    "other": max(tot - fe - lp - be, 0.0)}
            bottom = 0.0
            for label, key, color in segments:
                v = vals[key] * 1000.0  # ms
                ax.bar(x, v, width=0.36, bottom=bottom, color=color,
                       edgecolor="white", lw=0.4,
                       label=label if x < 1 else None)
                bottom += v
            delta = (statistics.mean(p[0]["elapsed_mean"] for p in data.values())
                     - statistics.mean(p[1]["elapsed_mean"]
                                       for p in data.values()))
            if pipe == "CIR":
                ax.annotate(f"+{delta * 1000:.1f} ms", (x, bottom),
                            textcoords="offset points", xytext=(0, 3),
                            ha="center", fontsize=8, color="0.2")
            xpos.append(x)
            xticks.append(x)
            xticklabels.append(pipe)
            x += 0.45
        x += 0.55  # gap between platform groups

    ax.set_xticks(xpos, xticklabels)
    # group labels
    for center, plat in ((xpos[0] + 0.225, "h100"), (xpos[2] + 0.225, "mi300x")):
        ax.annotate(PLATFORM_LABEL[plat], (center, -0.16),
                    xycoords=("data", "axes fraction"), ha="center",
                    fontsize=8.5, annotation_clip=False)
    ax.set_ylabel("Compile wall time (ms)")
    ax.set_ylim(0, 700)
    ax.grid(axis="x", visible=False)
    handles, labels = ax.get_legend_handles_labels()
    # dedupe legend entries
    seen, h2, l2 = set(), [], []
    for h, l in zip(handles, labels):
        if l not in seen:
            seen.add(l)
            h2.append(h)
            l2.append(l)
    ax.legend(h2, l2, loc="center left", bbox_to_anchor=(1.01, 0.5),
              frameon=False, ncols=1)
    fig.tight_layout()
    save(fig, "fig3_phase_breakdown")


# ---------------------------------------------------------------- Fig 4: runtime scatter
def fig4():
    from matplotlib.patches import Ellipse

    fig, ax = plt.subplots(figsize=(4.8, 4.4))
    for plat, marker in (("h100", "o"), ("mi300x", "s")):
        data = pairs_runtime(RUNTIME_JSON[plat])
        xs, ys = [], []
        for cs, os_ in data.values():
            xs.append(statistics.mean(os_) * 1000.0)  # ms
            ys.append(statistics.mean(cs) * 1000.0)
        ax.scatter(xs, ys, marker=marker, s=28, color=PLATFORM_COLOR[plat],
                   alpha=0.85, label=PLATFORM_LABEL[plat], zorder=3)

    lims = (0.1, 4000)
    ax.plot(lims, lims, color="black", lw=1.0, ls="--", zorder=2,
            label="parity (CIR = OG)")

    # highlight the fixed-offset cluster (HIP, short-running kernels);
    # drawn in axes-fraction coords so it stays elliptical on log axes
    cluster = Ellipse((0.30, 0.44), width=0.40, height=0.17,
                      fill=False, edgecolor="0.25", lw=1.0, ls=":",
                      transform=ax.transAxes, zorder=2)
    ax.add_patch(cluster)
    ax.text(0.12, 1.15, "fixed +6–7 ms\nper-run offset (HIP)",
            fontsize=8, color="0.2")
    ax.annotate("long-running HIP kernels:\ncovariance, correlation,\ngramschmidt: +2–6%",
                xy=(1455, 1540), xytext=(60, 1.0), fontsize=8, color="0.2",
                arrowprops=dict(arrowstyle="->", color="0.35", lw=0.8))

    ax.set_xscale("log")
    ax.set_yscale("log")
    ax.set_xlim(lims)
    ax.set_ylim(lims)
    ax.set_xlabel("OG runtime (ms, log scale)")
    ax.set_ylabel("CIR runtime (ms, log scale)")
    ax.set_aspect("equal")
    ax.legend(loc="upper left", frameon=False)
    fig.tight_layout()
    save(fig, "fig4_runtime_scatter")


# ---------------------------------------------------------------- Fig 5: binary size ratio
def fig5():
    fig, axes = plt.subplots(1, 2, figsize=(7.0, 4.6))
    for ax, plat in zip(axes, ("h100", "mi300x")):
        d = load(RUNTIME_JSON[plat])
        res = [r for r in d["results"] if r.get("compile_ok")]
        cir = {r["benchmark"]: r["binary_bytes"]
               for r in res if r["pipeline"] == "CIR"}
        og = {r["benchmark"]: r["binary_bytes"]
              for r in res if r["pipeline"] == "OG"}
        rows = sorted(((b, cir[b] / og[b]) for b in cir if b in og),
                      key=lambda x: x[1])
        names = [r[0] for r in rows]
        ratios = [r[1] for r in rows]
        gm = geomean(ratios)

        y = np.arange(len(rows))
        ax.barh(y, ratios, height=0.7, color=PLATFORM_COLOR[plat], alpha=0.85)
        ax.axvline(1.0, color="black", lw=1.0)
        ax.set_yticks(y, names)
        ax.set_xlabel("Binary size ratio CIR/OG (< 1: CIR is smaller)")
        ax.set_title(f"({'ab'[plat == 'mi300x']}) {PLATFORM_LABEL[plat]}")
        ax.text(0.97, 0.03, f"geomean = {gm:.4f}", transform=ax.transAxes,
                ha="right", va="bottom", fontsize=8.5, color="0.2",
                bbox=dict(facecolor="white", edgecolor="none", alpha=0.85,
                          pad=1.2))
        ax.set_xlim(0.84, 1.02)
        ax.grid(axis="y", visible=False)
    fig.tight_layout()
    save(fig, "fig5_size_ratio")


if __name__ == "__main__":
    fig1()
    fig2()
    fig3()
    fig4()
    fig5()
