# URL: https://atcoder.jp/contests/abs/tasks/abc085_b

def solve(io)
  n = io.get(Int32)
  d = io.get_c(n, Int32)
  io.put d.uniq.size
end

require "procon/io"

solve(ProconIO.new)