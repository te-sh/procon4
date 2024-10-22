# URL: https://atcoder.jp/contests/abc334/tasks/abc334_d

def solve(io)
  n, q = io.get2
  r = io.get_a(n, Int64)
  r.sort!

  s = Array.new(n, 0_i64)
  s[0] = r[0]
  (1...n).each do |i|
    s[i] = s[i-1] + r[i]
  end

  q.times do
    x = io.get(Int64)
    io.put s.bsearch_index { |si| si > x } || n
  end
end

require "procon"

solve(ProconIO.new)