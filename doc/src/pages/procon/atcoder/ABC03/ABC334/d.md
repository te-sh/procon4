---
layout: ../../../../../layouts/Content.astro
title: "ABC334 D"
problem: https://atcoder.jp/contests/abc334/tasks/abc334_d
---
$R_i$ が小さいソリから割り当てていくのが最善なので, $\{ R_i \}$ は昇順に並べ替えておく.

$i$ 番目のソリまでに必要なトナカイの総和をあらかじめ求めておき, クエリごとに二分探索する.
