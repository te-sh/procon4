---
layout: ../../../../../layouts/Content.astro
title: "ABC346 C"
problem: https://atcoder.jp/contests/abc346/tasks/abc346_c
---
$A_i$ はソートして uniq をかけておく.

ここで $K$ 以下の数値で $A$ の中に現れないものの総和というのは, $1$ から $K$ までの総和から $K$ 以下の $A_i$ の総和を引いたものになる. $1$ から $K$ までの総和は $K(K+1)/2$ で計算でき,
$K$ 以下の $A_i$ の総和は普通に計算すればいい.
