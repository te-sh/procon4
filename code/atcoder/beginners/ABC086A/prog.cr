# URL: https://atcoder.jp/contests/abs/tasks/abc086_a

def solve(io)
  a, b = io.get2(Int32)
  io.put(a.even? || b.even? ? "Even" : "Odd")
end

require "procon/io"

solve(ProconIO.new)