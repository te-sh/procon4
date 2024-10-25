# URL: https://atcoder.jp/contests/abc334/tasks/abc334_b

def solve(io)
  a, m, l, r = io.get4(Int64)

  l -= a; r -= a
  if l >= 0
    io.put r // m - cdiv(l, m) + 1
  elsif r <= 0
    io.put (-l) // m - cdiv(-r, m) + 1
  else
    io.put (-l) // m + r // m + 1
  end
end

require "procon"

solve(ProconIO.new)
