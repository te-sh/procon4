---
layout: ../../../../../layouts/Content.astro
title: "ABC345 D"
problem: https://atcoder.jp/contests/abc345/tasks/abc345_d
---
$N$ 枚のタイルをどの順に扱うかで全探索する.

各タイルは, そのままの向きで置く, 90度回転させて置く, 置かない3通りの置き方しかない. 裏返しても何の意味もない. また, 置かないという選択肢は置くタイルを先頭に固めた順序で対応可能なので, 実質置かない選択肢は考えなくてもいい.

各置き方でも全探索して置けるかどうかを判断する.
