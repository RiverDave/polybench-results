# Isolated launch-bounds experiment

- LLVM: `bb385fee62f2`
- PolyBench: `f5613c4`
- arch: `sm_86`
- samples: 20 paired + 5 warmups/arm

Both arms use `--clangir-offload-merge`; only `-f[no-]cir-infer-launch-bounds` differs.

| Benchmark | LB-off median (s) | LB-on median (s) | on/off paired gmean | 95% paired bootstrap CI | verdict |
|---|---:|---:|---:|---:|---|
| convolution-2d | 0.000353 | 0.000352 | 1.00082 | [0.99463, 1.00731] | inconclusive |
| 2mm | 0.005427 | 0.005421 | 0.99897 | [0.99789, 1.00010] | inconclusive |
| convolution-3d | 0.000948 | 0.000948 | 1.00110 | [0.99788, 1.00464] | inconclusive |
| 3mm | 0.001391 | 0.001391 | 1.00029 | [0.99753, 1.00291] | inconclusive |
| adi | 0.016210 | 0.016192 | 0.99806 | [0.99310, 1.00283] | inconclusive |
| atax | 0.003041 | 0.003042 | 1.00020 | [0.99956, 1.00081] | inconclusive |
| bicg | 0.002393 | 0.002393 | 0.99921 | [0.99829, 1.00004] | inconclusive |
| correlation | 1.684833 | 1.684276 | 0.99983 | [0.99940, 1.00028] | inconclusive |
| covariance | 1.683736 | 1.684763 | 1.00044 | [1.00001, 1.00086] | slowdown |
| doitgen | 0.004776 | 0.004784 | 1.00075 | [0.99867, 1.00293] | inconclusive |
| fdtd-2d | 0.178515 | 0.178501 | 1.00006 | [0.99984, 1.00027] | inconclusive |
| gemm | 0.000459 | 0.000459 | 0.99923 | [0.99511, 1.00366] | inconclusive |
| gemver | 0.002706 | 0.002703 | 0.99934 | [0.99850, 1.00017] | inconclusive |
| gesummv | 0.001793 | 0.001783 | 0.99826 | [0.99332, 1.00396] | inconclusive |
| gramschmidt | 2.437291 | 2.437416 | 1.00006 | [0.99998, 1.00014] | inconclusive |
| jacobi-1d-imper | 0.127628 | 0.127578 | 0.99872 | [0.99289, 1.00440] | inconclusive |
| jacobi-2d-imper | 0.000998 | 0.000999 | 1.00106 | [0.99660, 1.00631] | inconclusive |
| lu | 0.050002 | 0.050003 | 0.99904 | [0.99679, 1.00114] | inconclusive |
| mvt | 0.003029 | 0.003030 | 1.00046 | [0.99975, 1.00114] | inconclusive |
| syr2k | 0.019324 | 0.019321 | 1.00000 | [0.99985, 1.00017] | inconclusive |
| syrk | 0.009959 | 0.009960 | 0.99998 | [0.99977, 1.00021] | inconclusive |

**Suite LB-on/LB-off geomean:** `0.99980`
**95% benchmark-bootstrap CI:** `[0.99944, 1.00017]`

Raw ptxas logs, cuobjdump resource usage, SASS, binaries, validation, and samples are preserved alongside this report.
