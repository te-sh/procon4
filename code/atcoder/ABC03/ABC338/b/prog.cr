# URL: https://atcoder.jp/contests/abc338/tasks/abc338_b

def solve(io)
  s = io.get(String)

  h = Hash(Char, Int32).new(0)
  s.each_char do |c|
    h[c] += 1
  end
  m = h.values.max

  ('a'..'z').each do |c|
    io.put_e c if h[c] == m
  end
end

require "procon"

solve(ProconIO.new)