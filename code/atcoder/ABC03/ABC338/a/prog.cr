# URL: https://atcoder.jp/contests/abc338/tasks/abc338_a

def solve(io)
  s = io.get(String)
  io.put s =~ /^[A-Z][a-z]*$/ ? "Yes" : "No"
end

require "procon"

solve(ProconIO.new)