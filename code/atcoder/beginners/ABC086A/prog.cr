# URL: https://atcoder.jp/contests/abs/tasks/abc086_a

def solve(io)
  a, b = io.get2
  io.put(a.even? || b.even? ? "Even" : "Odd")
end

require "procon"

solve(ProconIO.new)