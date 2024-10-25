# URL: https://atcoder.jp/contests/abs/tasks/arc089_a

def solve(io)
  n = io.get
  t, x, y = io.get3_c(n)
  t.unshift(0)
  x.unshift(0)
  y.unshift(0)
  t.zip(x, y).each_cons(2) do |(p1, p2)|
    t1, x1, y1 = p1
    t2, x2, y2 = p2
    ti = t2 - t1
    di = (x2 - x1).abs + (y2 - y1).abs
    io.put_e "No" if di > ti
    ti -= di
    io.put_e "No" if ti.odd?
  end
  io.put "Yes"
end

require "procon"

solve(ProconIO.new)
