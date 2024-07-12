# URL: https://atcoder.jp/contests/abc342/tasks/abc342_b

def solve(io)
  n = io.get
  p = io.get_a(n)

  q = io.get
  q.times do
    a, b = io.get2
    ia = p.index!(a)
    ib = p.index!(b)
    io.put ia < ib ? a : b
  end
end

require "procon"

solve(ProconIO.new)
