# URL: https://atcoder.jp/contests/abc336/tasks/abc336_b

def solve(io)
  n = io.get
  io.put n.to_s(2).reverse.index('1')
end

require "procon"

solve(ProconIO.new)