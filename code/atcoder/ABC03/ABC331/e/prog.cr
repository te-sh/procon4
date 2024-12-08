# URL: https://atcoder.jp/contests/abc331/tasks/abc331_e

def solve(io)
  n, m, l = io.get3
  a = io.get_a(n)
  b = io.get_a(m)
  c, d = io.get2_c(l)
  c.map!(&.- 1); d.map!(&.- 1)

  bb = b.map_with_index { |bi, i| {bi, i} }.sort_by { |bbi| bbi[0] }.reverse

  p = Hash(Int32, Hash(Int32, Bool)).new { |h, k| h[k] = Hash(Int32, Bool).new { false } }
  c.zip(d) do |ci, di|
    p[ci][di] = true
  end

  r = 0
  a.each_with_index do |ai, i|
    bb.each do |bj, j|
      unless p[i][j]
        max_u(r, ai + bj)
        break
      end
    end
  end

  io.put r
end

require "procon"

solve(ProconIO.new)
