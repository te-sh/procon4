# URL: https://atcoder.jp/contests/abs/tasks/abc085_c

def solve(io)
  n, y = io.get2
  y //= 1000

  (0..n).each do |a|
    (0..n).each do |b|
      c = y - (a * 10 + b * 5)
      if c >= 0 && a + b + c == n
        io.put_ae [a, b, c]
      end
    end
  end
  io.put_a [-1, -1, -1]
end

require "procon"

solve(ProconIO.new)