# URL: https://atcoder.jp/contests/abc332/tasks/abc332_a

def solve(io)
  n, s, k = io.get3
  p, q = io.get2_c(n)

  r = p.zip(q).map { |(pi, qi)| pi * qi }.sum
  io.put r >= s ? r : r + k
end

require "procon"

solve(ProconIO.new)
