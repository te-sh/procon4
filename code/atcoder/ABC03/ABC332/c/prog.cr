# URL: https://atcoder.jp/contests/abc332/tasks/abc332_c

def solve(io)
  n, m = io.get2
  s = io.get(String)

  t = s.split(/0+/)

  r = 0
  t.each do |ti|
    a = ti.count('1')
    b = ti.count('2')
    max_u(r, b + {a-m, 0}.max)
  end

  io.put r
end

require "procon"

solve(ProconIO.new)