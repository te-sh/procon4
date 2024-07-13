---
layout: ../../../../../layouts/Content.astro
title: "ABC341 D"
problem: https://atcoder.jp/contests/abc341/tasks/abc341_d
---
ある数 $x$ について, その数以下の $N$ か $M$ のどちらか1つでのみ割り切れる数を数える. この数は,

$$
\floor{\frac{x}{N}} + \floor{\frac{x}{M}} - 2 \cdot \floor{\frac{x}{\lcm(N, M)}}
$$

で求めることができる.

この数が $K$ となる最小の $x$ を求めれば, それが答えとなる.

あとは二分探索である.
