# URL: https://atcoder.jp/contests/abc345/tasks/abc345_b

def solve(io)
  x = io.get(Int64)
  io.put cdiv(x, 10)
end

require "procon"

solve(ProconIO.new)
