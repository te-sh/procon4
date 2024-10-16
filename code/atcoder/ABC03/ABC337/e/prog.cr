# URL: https://atcoder.jp/contests/abc337/tasks/abc337_e

def solve(io)
  n = io.get

  m = (n-1).bit_length
  g = Array.new(m) { [] of Int32 }

  io.put m

  n.times do |i|
    m.times do |j|
      g[j] << i + 1 if i.bit?(j)
    end
  end

  g.each do |gi|
    io.put_a [gi.size] + gi
  end

  s = io.get(String)
  io.put s.reverse.to_i(2) + 1
end

require "procon"

solve(ProconIO.new)