---
layout: ../../../../../layouts/Content.astro
title: "ABC332 C"
problem: https://atcoder.jp/contests/abc332/tasks/abc332_c
---
`0` の日があればTシャツは洗濯されるので, `0` に挟まれた連続した `1` か `2` についてそれぞれ考えて, そのうちの最大の必要購入枚数を求める.

連続した `1` か `2` において `1` の登場回数 $A$ と `2` の登場回数 $B$ を求める. このとき, この連続した `1` か `2` の日程において必要なロゴ入りTシャツの枚数は $B + \max \{A - M, 0\}$ となる.