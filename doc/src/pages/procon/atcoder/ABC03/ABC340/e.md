---
layout: ../../../../../layouts/Content.astro
title: "ABC340 E"
problem: https://atcoder.jp/contests/abc340/tasks/abc340_e
---
imos 法を使う.

各操作では以下の作業を行う.

箱 $B_i$ に入ってる玉の数を $D$ とする.

箱 $B_i$ の玉の数から $D$ を引く.

すべての箱の玉の数に $\floor{D/N}$ を加える. $D$ を $N$ で割ったあまりを $E$ とする.

$B_i + E \lt N$ ならば, $[B_i + 1, B_i + E]$ の箱に $1$ を加える. そうでなければ, $[B_i+1, N)$ の箱に $1$ を加え, $[0, E-(N-B_i-1))$ の箱に $1$ を加える.
