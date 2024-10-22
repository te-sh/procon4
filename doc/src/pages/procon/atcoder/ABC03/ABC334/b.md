---
layout: ../../../../../layouts/Content.astro
title: "ABC334 B"
problem: https://atcoder.jp/contests/abc334/tasks/abc334_b
---
$A$ を $0$ に移動させることで考えやすくする. このとき, $L$, $R$ は $L-A$, $R-A$ に移動となる.

$0 \leq L \leq R$ のときは, 間の木の本数は $\floor{R/M} - \ceil{L/M} + 1$ となる.

$L \leq 0 \leq R$ のときは, 間の木の本数は $\floor{-L/M} + \floor{R/M} + 1$ となる.

$L \leq R \leq 0$ のときは, 間の木の本数は $\floor{-L/M} - \ceil{-R/M} + 1$ となる.
