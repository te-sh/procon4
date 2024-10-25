# URL: https://atcoder.jp/contests/abc344/tasks/abc344_a

def solve(io)
  s = io.get(String)
  m = /([^\|]*)\|[^\|]*\|([^\|]*)/.match(s).not_nil!
  io.put m[1] + m[2]
end

require "procon"

solve(ProconIO.new)
