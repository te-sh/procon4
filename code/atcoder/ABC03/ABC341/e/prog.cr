# URL: https://atcoder.jp/contests/abc341/tasks/abc341_e

def solve(io)
  n, q = io.get2
  s = io.get(String)
  a = s.each_char.map_with_index { |c, i|
    c == '0' && i.even? || c == '1' && i.odd? ? 1 : -1
  }
  
  op = ->(a : Int32, b : Int32) { a + b }
  mapping = ->(f : Int32, x : Int32) { f * x }
  composition = ->(f : Int32, g : Int32) { f * g }
  st = AtCoder::LazySegTree(Int32, Int32).new(a, op, mapping, composition)

  q.times do
    k, l, r = io.get3; l -= 1; r -= 1
    case k
    when 1
      st[l..r] = -1
    when 2
      io.put st[l..r].abs == r-l+1 ? "Yes" : "No"
    end
  end
end

require "procon"
require "atcoder/lazy_seg_tree"

solve(ProconIO.new)