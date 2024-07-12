# URL: https://atcoder.jp/contests/abc341/tasks/abc341_b

def solve(io)
  n = io.get
  a = io.get_a(n, Int64)

  (n-1).times do |i|
    si, ti = io.get2
    a[i+1] += a[i] // si * ti
  end

  io.put a.last
end

require "procon"

solve(ProconIO.new)