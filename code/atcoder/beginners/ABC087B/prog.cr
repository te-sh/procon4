# URL: https://atcoder.jp/contests/abs/tasks/abc087_b

def solve(io)
  a = io.get
  b = io.get
  c = io.get
  x = io.get

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

require "procon"

solve(ProconIO.new)
