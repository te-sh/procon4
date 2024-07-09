# :::::::::::::::::::: procon/util
#
# a = {a, b}.min を計算します
#
macro min_u(a, b)
  {{a}} = { {{a}}, {{b}} }.min
end

#
# a = {a, b}.max を計算します
#
macro max_u(a, b)
  {{a}} = { {{a}}, {{b}} }.max
end

#
# タプルの配列を record の配列に変換します
#
macro records(rec, a)
  {{a}}.map { |v| {{rec}}.new(*v) }
end
# ::::::::::::::::::::
