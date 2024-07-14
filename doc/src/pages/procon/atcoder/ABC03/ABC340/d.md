---
layout: ../../../../../layouts/Content.astro
title: "ABC340 D"
problem: https://atcoder.jp/contests/abc340/tasks/abc340_d
---
典型的な Dijkstra 法を使う問題である.

$N$ 頂点のグラフを作成し, 頂点 $i$ から頂点 $i+1$ に重み $A_i$ の辺を引き, 頂点 $i$ から頂点 $X_i$ に重み $B_i$ の辺を引く.

あとは Dijkstra にかけるだけ.
