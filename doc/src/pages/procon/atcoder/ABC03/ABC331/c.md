---
layout: ../../../../../layouts/Content.astro
title: "ABC331 C"
problem: https://atcoder.jp/contests/abc331/tasks/abc331_c
---
$A$ を昇順にソートした $B$ を別に用意し, 累積和を取っておく.

後は $A_i$ より大きい値になるインデックスを $B$ から二分探索で見つけ出し, 累積和から答えを求めればいい.
