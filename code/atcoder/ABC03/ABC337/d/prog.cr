# URL: https://atcoder.jp/contests/abc337/tasks/abc337_d

INF = 10 ** 9

def solve(io)
  h, w, k = io.get3
  s = io.get_c(h, String)

  r = INF

  h.times do |i|
    b = CumulativeSum.new(Array.new(w) { |j| s[i][j] == 'x' ? 1 : 0 })
    c = CumulativeSum.new(Array.new(w) { |j| s[i][j] == '.' ? 1 : 0 })

    (0..w-k).each do |j|
      next unless b[j...j+k].zero?
      min_u(r, c[j...j+k])
    end
  end

  w.times do |j|
    b = CumulativeSum.new(Array.new(h) { |i| s[i][j] == 'x' ? 1 : 0 })
    c = CumulativeSum.new(Array.new(h) { |i| s[i][j] == '.' ? 1 : 0 })

    (0..h-k).each do |i|
      next unless b[i...i+k].zero?
      min_u(r, c[i...i+k])
    end
  end

  io.put r == INF ? -1 : r
end

require "procon"
require "procon/data_structure/cumulative_sum"

solve(ProconIO.new)