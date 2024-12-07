# URL: https://atcoder.jp/contests/abc331/tasks/abc331_d

def solve(io)
  n, q = io.get2
  ps = io.get_c(n, String)

  p = MdArray.new(n, n, 0_i64)
  (0...n).each do |i|
    (0...n).each do |j|
      p[i][j] = ps[i][j] == 'B' ? 1 : 0
    end
  end

  s = MdArray.new(n, n, 0_i64)
  (0...n).each do |i|
    (0...n).each do |j|
      s[i][j] = p[i][j]
      s[i][j] += s[i-1][j] if i > 0
      s[i][j] += s[i][j-1] if j > 0
      s[i][j] -= s[i-1][j-1] if i > 0 && j > 0
    end
  end

  cs = ->(i : Int32, j : Int32) do
    return 0 if i < 0 || j < 0

    id = i // n
    im = i % n
    jd = j // n
    jm = j % n

    s[n-1][n-1] * id * jd + s[im][n-1] * jd + s[n-1][jm] * id + s[im][jm]
  end

  q.times do
    a, b, c, d = io.get4
    io.put cs.call(c, d) - cs.call(c, b-1) - cs.call(a-1, d) + cs.call(a-1, b-1)
  end
end

require "procon"
require "procon/md_array"

solve(ProconIO.new)
