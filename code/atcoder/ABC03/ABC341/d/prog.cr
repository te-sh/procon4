# URL: https://atcoder.jp/contests/abc341/tasks/abc341_d

def solve(io)
  n, m, k = io.get3(Int64)
  l = n.lcm(m)

  r = (1_i64..10_i64**18*2).bsearch { |x|
    x // n + x // m - x // l * 2 >= k
  }

  io.put r
end

require "procon"

solve(ProconIO.new)
