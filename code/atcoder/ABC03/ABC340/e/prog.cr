# URL: https://atcoder.jp/contests/abc340/tasks/abc340_e

record S, value : Int64, size : Int32

def solve(io)
  n, m = io.get2
  a = io.get_a(n, Int64).map { |ai| S.new(ai, 1) }
  b = io.get_a(m)

  op = ->(a : S, b : S) { S.new(a.value + b.value, a.size + b.size) }
  mapping = ->(f : Int64, x : S) { S.new(x.value + f * x.size, x.size) }
  composition = ->(f : Int64, g : Int64) { f + g }
  st = AtCoder::LazySegTree(S, Int64).new(a, op, mapping, composition)

  b.each do |bi|
    d = st[bi].value
    st[bi] = -d
    st[0...n] = d // n
    e = d % n
    if e == 0
      next
    elsif bi + e < n
      st[bi+1..bi+e] = 1
    else
      st[bi+1...n] = 1
      st[0...e-(n-bi-1)] = 1
    end
  end

  io.put_a (0...n).map { |i| st[i].value }
end

require "procon"
require "atcoder/lazy_seg_tree"

solve(ProconIO.new)