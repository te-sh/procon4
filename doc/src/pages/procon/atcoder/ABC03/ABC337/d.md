---
layout: ../../../../../layouts/Content.astro
title: "ABC337 D"
problem: https://atcoder.jp/contests/abc337/tasks/abc337_d
---
$i$ 行目について考える.

まず `x` のマスの値を $1$ とした配列を用意して累積和を取っておく. このとき, 区間 $[j, j+K)$ の和が $0$ でなければこの区間をすべて `o` にすることはできない.

次に `o` のマスの値を $1$ とした配列を用意して同様に累積和を取っておく. このとき, 区間 $[j, j+K)$ の和を $C_j$ とすると, $K-C_j$ 個の `.` を `o` に変えればこの区間をすべて `o` にすることができる.

これをすべての行について行い, 同様に列についても計算を行い, 最小値を取る.
