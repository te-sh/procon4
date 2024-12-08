# URL: https://atcoder.jp/contests/abc346/tasks/abc346_a

def solve(io)
  n = io.get
  a = io.get_a(n)

  b = Array.new(n-1, 0)
  (0...n-1).each do |i|
    b[i] = a[i] * a[i+1]
  end

  io.put_a b
end

require "procon"

solve(ProconIO.new)
