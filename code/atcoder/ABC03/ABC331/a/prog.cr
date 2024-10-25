# URL: https://atcoder.jp/contests/abc331/tasks/abc331_a

def solve(io)
  mm, dd = io.get2
  y, m, d = io.get3

  d += 1
  if d > dd
    d = 1
    m += 1
  end

  if m > mm
    m = 1
    y += 1
  end

  io.put_a [y, m, d]
end

require "procon"

solve(ProconIO.new)
