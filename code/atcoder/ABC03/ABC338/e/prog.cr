# URL: https://atcoder.jp/contests/abc338/tasks/abc338_e

def solve(io)
  n = io.get
  a, b = io.get2_c(n)

  a.map!(&.- 1)
  b.map!(&.- 1)

  n.times do |i|
    a[i], b[i] = b[i], a[i] if a[i] > b[i]
  end

  ft = AtCoder::FenwickTree(Int32).new(n * 2)
  a.zip(b).each do |(ai, bi)|
    ft.add(ai, +1)
    ft.add(bi, -1)
  end

  a.zip(b).each do |(ai, bi)|
    io.put_e "Yes" unless ft[ai..bi].zero?
  end

  io.put "No"
end

require "procon"

require "atcoder/fenwick_tree"

solve(ProconIO.new)