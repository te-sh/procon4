---
layout: ../../../../../layouts/Content.astro
title: "ABC332 E"
problem: https://atcoder.jp/contests/abc332/tasks/abc332_e
---
まず, 平均は $a = (\sum W_i)/D$ で求まる. また, グッズのビット表現ごとの重さの合計はあらかじめ計算しておく.

あとは Bit DP で $dp[i][j]$ に $i$ 個までの袋に入れたとき, 残り $j$ であるグッズのビット表現が残ったときのそれまに計算できる最小の分散を入れるようにして DP を回す.

ただし, そのままで回すと $O(4^N D)$ になって間に合わないので, DP の途中の部分集合を列挙するときにアルゴリズムを工夫することで $O(3^N D)$ で回せるようになって, これで間に合う.
