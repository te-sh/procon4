# URL: https://atcoder.jp/contests/abc335/tasks/abc335_a

def solve(io)
  s = io.get(String)
  io.put s[..-2] + "4"
end

require "procon"

solve(ProconIO.new)