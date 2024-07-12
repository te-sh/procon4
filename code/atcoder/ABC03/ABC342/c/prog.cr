# URL: https://atcoder.jp/contests/abc342/tasks/abc342_c

def solve(io)
  n = io.get
  s = io.get(String)

  h = Hash(Char, Char).new
  ('a'..'z').each do |c|
    h[c] = c
  end

  q = io.get
  q.times do
    sc, sd = io.get2(String)
    c, d = sc[0], sd[0]
    h.each do |k, v|
      h[k] = d if v == c
    end
  end

  t = ""
  s.each_char do |c|
    t += h[c]
  end

  io.put t
end

require "procon"

solve(ProconIO.new)
