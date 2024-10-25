# URL: https://atcoder.jp/contests/abs/tasks/abc083_b

def solve(io)
  n, a, b = io.get3

  sum = 0
  (1..n).each do |i|
    s = i.digits.sum
    sum += i if a <= s && s <= b
  end

  io.put sum
end

require "procon"

solve(ProconIO.new)
