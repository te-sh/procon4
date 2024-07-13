# URL: https://atcoder.jp/contests/abc340/tasks/abc340_a

def solve(io)
  a, b, d = io.get3
  io.put_a (a..b).step(by: d)
end

require "procon"

solve(ProconIO.new)