# URL: https://atcoder.jp/contests/abc336/tasks/abc336_c

def solve(io)
  n = io.get(Int64)
  m = (n - 1).to_s(5)
  io.put m.each_char.map { |c| c.to_i * 2 }.join
end

require "procon"

solve(ProconIO.new)
