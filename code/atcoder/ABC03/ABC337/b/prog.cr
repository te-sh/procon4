# URL: https://atcoder.jp/contests/abc337/tasks/abc337_b

def solve(io)
  s = io.get(String)

  io.put /^A*B*C*$/ =~ s ? "Yes" : "No"
end

require "procon"

solve(ProconIO.new)
