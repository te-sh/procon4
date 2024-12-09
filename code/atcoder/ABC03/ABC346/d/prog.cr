# URL: https://atcoder.jp/contests/abc346/tasks/abc346_d

INF = 10_i64 ** 18

def solve(io)
  n = io.get
  s = io.get(String)
  c = io.get_a(n, Int64)

  d = s.chars.map(&.to_i)
  1.step(to: n-1, by: 2) do |i|
    d[i] = 1-d[i]
  end

  r = INF
  2.times do |i|
    t = d[0] == i ? 0_i64 : c[0]
    (1...n).each do |j|
      t += d[j] == 1-i ? 0_i64 : c[j]
    end
    min_u(r, t)
    
    (1...n-1).each do |j|
      t += d[j] == 1-i ? c[j] : -c[j]
      min_u(r, t)
    end
  end

  io.put r
end

require "procon"
require "procon/md_array"

solve(ProconIO.new)
