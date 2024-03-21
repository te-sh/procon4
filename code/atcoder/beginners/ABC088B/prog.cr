# URL: https://atcoder.jp/contests/abs/tasks/abc088_b

def solve(io)
  n = io.get(Int32)
  a = io.get_a(n, Int32)
  a = a.sort.reverse
  s1, s2 = 0, 0
  a.each_with_index do |ai, i|
    if i.even?
      s1 += ai
    else
      s2 += ai
    end
  end
  io.put s1 - s2
end

require "procon/io"

solve(ProconIO.new)