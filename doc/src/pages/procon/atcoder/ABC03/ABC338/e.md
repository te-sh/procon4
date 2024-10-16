---
layout: ../../../../../layouts/Content.astro
title: "ABC339 E"
problem: https://atcoder.jp/contests/abc338/tasks/abc338_e
---
$A_i \gt B_i$ ならば $A_i$ と $B_i$ は入れ替える.

Fenwick Tree を用意して, インデックス $A_i$ の値を $+1$, インデックス $B_i$ の値を $-1$ に設定する.

このとき, 区間 $[A_i, B_i]$ の合計値が $0$ にならなければ交点があるということになる.
