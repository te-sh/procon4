# URL: https://atcoder.jp/contests/abc334/tasks/abc334_a

def solve(io)
  b, g = io.get2
  io.put b > g ? "Bat" : "Glove"
end

require "procon"

solve(ProconIO.new)
