---
layout: ../../../../../layouts/Content.astro
title: "ABC338 C"
problem: https://atcoder.jp/contests/abc338/tasks/abc338_c
---
料理 A を $x$ 個作成すると仮定したときに作れる料理 B の数は $\min \{ (Q_i - xA_i) / B_i \}$ (ただし, $B_i = 0$ の場合は $\infty$ 扱いとする) で求められる.

$x$ の最大値は $\max \{ Q_i \}$ なので, これを全探索する.
