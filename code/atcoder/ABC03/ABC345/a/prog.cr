# URL: https://atcoder.jp/contests/abc345/tasks/abc345_a

def solve(io)
  s = io.get(String)
  io.put /^<=+>$/ =~ s ? "Yes" : "No"
end

require "procon/io"

solve(ProconIO.new)