# URL: https://atcoder.jp/contests/abc343/tasks/abc343_b

def solve(io)
  n = io.get
  a = io.get_m(n, n)

  n.times do |i|
    c = (0...n).select { |j| i != j && a[i][j] == 1 }
    io.put_a c.map(&.+ 1)
  end
end

require "procon"

solve(ProconIO.new)
