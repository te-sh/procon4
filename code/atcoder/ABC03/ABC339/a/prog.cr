# URL: https://atcoder.jp/contests/abc339/tasks/abc339_a

def solve(io)
  s = io.get(String)
  io.put s.split('.').last
end

require "procon"

solve(ProconIO.new)
