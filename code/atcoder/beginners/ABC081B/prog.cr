# URL: https://atcoder.jp/contests/abs/tasks/abc081_b

def solve(io)
  n = io.get
  a = io.get_a(n)
  c = 0
  while a.all?(&.even?)
    c += 1
    a.map! { |ai| ai // 2 }
  end
  io.put c
end

require "procon"

solve(ProconIO.new)