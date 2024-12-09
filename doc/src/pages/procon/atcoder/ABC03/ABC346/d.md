---
layout: ../../../../../layouts/Content.astro
title: "ABC346 D"
problem: https://atcoder.jp/contests/abc346/tasks/abc346_d
---
偶数文字目の文字を反転すると, 目的の文字列は `000...0111...1` か `111...1000...0` のどちらかになる. これを両方計算して小さい方のコストを採用する.

`000...0111...1` を作成する最低のコストを考える. まずは `0111...1` を作るためのコストを計算する. 次に `00111...1` を作るコストを計算するのだが, これば `0111...1` のコストから計算できる.
以下, これを繰り返して `000...01` まで計算する.