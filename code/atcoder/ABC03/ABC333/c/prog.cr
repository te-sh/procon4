# URL: https://atcoder.jp/contests/abc333/tasks/abc333_c

def solve(io)
  n = io.get

  d = [] of Int32
  (n-1).times do
    j = d.index { |di| di < 3 }

    if j.nil?
      j = d.size
      d << 0
    end

    d[j] += 1
    d.fill(d[j], 0...j)
  end

  io.put d.join.reverse + '3'
end

require "procon"

solve(ProconIO.new)
