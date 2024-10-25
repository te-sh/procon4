# URL: https://atcoder.jp/contests/abc331/tasks/abc331_b

def solve(io)
  n, s, m, l = io.get4(Int64)

  r = 10_i64 ** 18
  (0..17).each do |i|
    (0..13).each do |j|
      (0..9).each do |k|
        if i*6 + j*8 + k*12 >= n
          min_u(r, i*s + j*m + k*l)
        end
      end
    end
  end
  io.put r
end

require "procon"

solve(ProconIO.new)
