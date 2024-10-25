# URL: https://atcoder.jp/contests/abc337/tasks/abc337_a

def solve(io)
  n = io.get
  x, y = io.get2_c(n)

  sx, sy = x.sum, y.sum

  if sx > sy
    io.put "Takahashi"
  elsif sx < sy
    io.put "Aoki"
  else
    io.put "Draw"
  end
end

require "procon"

solve(ProconIO.new)