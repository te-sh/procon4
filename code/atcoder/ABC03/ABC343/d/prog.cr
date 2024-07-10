# URL: https://atcoder.jp/contests/abc343/tasks/abc343_d

def solve(io)
  n, t = io.get2

  p = Array(Int64).new(n) { 0_i64 }
  h = Hash(Int64, Int32).new { 0 }
  h[0] = n
  k = 1

  t.times do
    a, b = io.get2
    a -= 1
    h[p[a]] -= 1
    k -= 1 if h[p[a]] == 0
    p[a] += b
    k += 1 if h[p[a]] == 0
    h[p[a]] += 1
    io.put k
  end
end

require "procon"

solve(ProconIO.new)
