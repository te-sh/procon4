# URL: https://atcoder.jp/contests/abs/tasks/abc087_b

def solve(io)
  a = io.get(Int32)
  b = io.get(Int32)
  c = io.get(Int32)
  x = io.get(Int32)

  cnt = 0
  (0..a).each do |ai|
    (0..b).each do |bi|
      (0..c).each do |ci|
        cnt += 1 if ai * 500 + bi * 100 + ci * 50 == x
      end
    end
  end

  io.put cnt
end

require "procon/io"

solve(ProconIO.new)