# URL: https://atcoder.jp/contests/abc332/tasks/abc332_e

def solve(io)
  n, d = io.get2
  w = io.get_a(n)

  a = w.sum / d

  sw = Array.new(1<<n) do |i|
    (0...n).map { |j| i.bit?(j) ? w[j] : 0 }.sum
  end

  dp = MdArray.new(d+1, 1<<n, 1e+100)
  dp[0][(1<<n)-1] = 0

  d.times do |i|
    (1<<n).times do |j|
      j.bit_subsets.each do |k|
        min_u(dp[i+1][j^k], dp[i][j] + (sw[k] - a)**2 / d)
      end
    end
  end

  io.put dp[d][0]
end

require "procon"
require "procon/bit"
require "procon/md_array"

solve(ProconIO.new)
