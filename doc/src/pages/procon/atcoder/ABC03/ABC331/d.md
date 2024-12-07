---
layout: ../../../../../layouts/Content.astro
title: "ABC331 D"
problem: https://atcoder.jp/contests/abc331/tasks/abc331_d
---
2次元累積和を使う.

まずは $([0, N), [0, N))$ の範囲で累積和を求める. これを $S_{i,j}$ とする.

$i \geq N$ または $j \geq N$ の場合の $S_{i, j}$ を考える.
ここで, $i_d = \floor{i/N}$, $i_m = i \mod N$, $j_d = \floor{j/N}$, $j_m = j \mod N$ とする.

このとき, $S_{i, j}$ は次のようになる.

$$
S_{i,j} = S_{N-1, N-1} \cdot i_d \cdot j_d
  + S_{i_m, N-1} \cdot j_d + S_{N-1, j_m} \cdot i_d + S_{i_m, j_m}
$$

これで $S_{i,j}$ は $O(1)$ で求められるので, 各クエリも $O(1)$ で処理できる.
