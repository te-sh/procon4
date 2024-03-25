# URL: https://atcoder.jp/contests/abc344/tasks/abc344_d

MAX = 10 ** 9

def solve(io)
  t = io.get(String)
  n = io.get

  dp = Array.new_md(n + 1, t.size + 1, MAX)
  dp[0][0] = 0

  n.times do |i|
    si = io.get
    ai = io.get_a(si, String)
    (t.size + 1).times do |j|
      min_u(dp[i + 1][j], dp[i][j])
      ai.each do |aij|
        min_u(dp[i + 1][j + aij.size], dp[i][j] + 1) if t[j..].starts_with?(aij)
      end
    end
  end

  io.put dp[n][t.size] >= MAX ? -1 : dp[n][t.size]
end

require "procon"

solve(ProconIO.new)