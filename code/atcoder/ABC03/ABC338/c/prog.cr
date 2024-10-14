# URL: https://atcoder.jp/contests/abc338/tasks/abc338_c

INF = 10 ** 9

def solve(io)
  n = io.get
  q = io.get_a(n)
  a = io.get_a(n)
  b = io.get_a(n)

  mc = 0
  (0..q.max).each do |x|
    r = q.zip(a).map { |qi, ai| qi - x * ai }
    break if r.any?(&.negative?)

    y = r.zip(b).map { |ri, bi| bi > 0 ? ri // bi : INF }.min
    c = x + y
    max_u(mc, c)
  end
  io.put mc
end

require "procon"

solve(ProconIO.new)