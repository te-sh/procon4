# URL: https://atcoder.jp/contests/abc333/tasks/abc333_b

def solve(io)
  s = io.get(String)
  t = io.get(String)

  u = ((s[0] - 'A') - (s[1] - 'A')).abs
  u = 5-u if u >= 3
  v = ((t[0] - 'A') - (t[1] - 'A')).abs
  v = 5-v if v >= 3

  io.put u == v ? "Yes" : "No"
end

require "procon"

solve(ProconIO.new)
