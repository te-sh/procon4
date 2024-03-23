# URL: https://atcoder.jp/contests/abc345/tasks/abc345_c

def solve(io)
  s = io.get(String)
  h = Hash(Char, Int32).new { 0 }
  cnt = 0_i64
  s.each_char.with_index do |c, i|
    cnt += i - h[c]
    h[c] += 1
  end
  cnt += 1 if h.values.any? { |i| i > 1 }
  io.put cnt
end

require "procon"

solve(ProconIO.new)