# URL: https://atcoder.jp/contests/abs/tasks/abc085_b

def solve(io)
  n = io.get
  d = io.get_c(n)
  io.put d.uniq.size
end

require "procon"

solve(ProconIO.new)