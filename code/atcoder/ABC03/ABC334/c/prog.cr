# URL: https://atcoder.jp/contests/abc334/tasks/abc334_c

def solve(io)
  n, k = io.get2
  a = io.get_a(k)

  s = Set.new(a)
  b = [] of Int32
  (1..n).each do |i|
    b << i
    b << i unless s.includes?(i)
  end

  b1 = [] of Int32
  b2 = [] of Int32
  (0...b.size-1).each do |i|
    if i.even?
      b1 << b[i+1] - b[i]
    else
      b2 << b[i+1] - b[i]
    end
  end

  c1 = CumulativeSum.new(b1)
  c2 = CumulativeSum.new(b2)

  if k.even?
    io.put c1[0...b1.size]
  else
    r = n
    (0..b1.size).each do |i|
      min_u(r, c1[0...i] + c2[i...b2.size])
    end
    io.put r
  end
end

require "procon"

require "procon/data_structure/cumulative_sum"

solve(ProconIO.new)