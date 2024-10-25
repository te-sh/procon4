# URL: https://atcoder.jp/contests/abc344/tasks/abc344_c

def solve(io)
  n = io.get
  a = io.get_a(n)
  m = io.get
  b = io.get_a(m)
  l = io.get
  c = io.get_a(l)

  h = Hash(Int32, Bool).new { false }
  a.each do |ai|
    b.each do |bi|
      c.each do |ci|
        h[ai + bi + ci] = true
      end
    end
  end

  q = io.get
  x = io.get_a(q)
  x.each do |xi|
    io.put h[xi] ? "Yes" : "No"
  end
end

require "procon"

solve(ProconIO.new)
