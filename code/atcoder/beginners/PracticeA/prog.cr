# URL: https://atcoder.jp/contests/abs/tasks/practice_1

def solve(io)
  a = io.get
  b, c = io.get2
  s = io.get(String)

  io.put_a([a + b + c, s])
end

require "procon"

solve(ProconIO.new)
