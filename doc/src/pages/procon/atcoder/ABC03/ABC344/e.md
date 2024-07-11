---
layout: ../../../../../layouts/Content.astro
title: "ABC344 E"
problem: https://atcoder.jp/contests/abc344/tasks/abc344_e
---
双方向 LinkedList を用意する. また, 値 $x$ を表す LinkedList のノードのハッシュを用意する.

あとはクエリを読み込んで, 該当の LinkedList のノードをハッシュから特定し, 新しい LinkedList のノードの追加または LinkedList のノードの削除を行う. また, ハッシュの更新も同時に行う.

LinkedList の先頭と末尾に番兵を用いると実装が楽になる.
