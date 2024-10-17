# URL: https://atcoder.jp/contests/abc336/tasks/abc336_d

def solve(io)
  n = io.get
  a = io.get_a(n)

  b = a.map_with_index { |ai, i| ai - (i + 1) }
  st = AtCoder::SegTree.new(b) { |a, b| {a, b}.min }
  x = (0...n).map { |i|
    (0...n-i).bsearch { |j| st[i..i+j] < -i } || n-i
  }

  c = a.reverse.map_with_index { |ai, i| ai - (i + 1) }
  st = AtCoder::SegTree.new(c) { |a, b| {a, b}.min }
  y = (0...n).map { |i|
    (0...n-i).bsearch { |j| st[i..i+j] < -i } || n-i
  }.reverse

  m = 0
  (0...n).each do |i|
    mk = {x[i], (n-i).cdiv(2)}.min
    k = (1..mk).bsearch { |j| y[i+j*2-2] < j }
    max_u(m, k.nil? ? mk : k-1)
  end

  io.put m
end

require "procon"

require "atcoder/seg_tree"

solve(ProconIO.new)