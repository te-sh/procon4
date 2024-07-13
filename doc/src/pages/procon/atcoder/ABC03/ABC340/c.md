---
layout: ../../../../../layouts/Content.astro
title: "ABC340 C"
problem: https://atcoder.jp/contests/abc340/tasks/abc340_c
---
最初に配列 $A = (N)$ を用意する.

$A$ の最後の要素を取り出し, $\floor{x/2}$, $\ceil{x/2}$ を $A$ に戻すのを繰り返し, $A$ が空になったら終了する. ただし, $\floor{x/2}$, $\ceil{x/2}$ が $1$ の場合は $A$ に戻さない.

しかし, 愚直にやると TLE になるので, $x$ に対してこれを消すまでにどれだけの費用がかかるかをメモ化再帰で求める.
