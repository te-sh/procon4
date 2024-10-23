---
layout: ../../../../../layouts/Content.astro
title: "ABC333 E"
problem: https://atcoder.jp/contests/abc333/tasks/abc333_e
---
ポーションは必要となる直前にだけ拾うようにするのが最適である.

クエリは先読みしておく.

まずは $N$ 個のスタックを用意する. $j$ 番目のスタックを $S_j$ とする. そしてクエリを順に見ていき, $t_i = 1$ なら $S_{x_i}$ に $i$ を積む.

次にクエリを逆から見ていく.

$t_i = 1$ なら $S_{x_i}$ のトップを見て, それが $i$ と一致するなら $S_{x_i}$ のトップを降ろす. このときの $i$ のポーションは拾わない.

$t_i = 2$ なら $S_{x_i}$ のトップを降ろす. このときに降ろした $j$ のポーションは使う. $S_{x_i}$ が空ならモンスターは撃退できない.

これで拾うポーションは決まったので, 再びクエリを順に見ていき, 持っているポーションの数をシミュレートする. ただし, このときにはモンスターは必ず倒せるので, 持っている数だけカウントしておけばいい.