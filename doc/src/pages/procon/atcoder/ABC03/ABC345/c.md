---
layout: ../../../../../layouts/Content.astro
title: "ABC345 C"
problem: https://atcoder.jp/contests/abc345/tasks/abc345_c
---
$n$ 文字目を見たとき, その文字より前で $n$ 文字目と違う文字と交換すれば異なる文字列を作ることができる.

前から文字列を見て, 出てくる文字をカウントしていくことでこれを実現できる.

同じ文字が2文字以上ある場合は元と同じ文字列も候補になるので $+1$ する.
