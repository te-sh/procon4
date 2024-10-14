# URL: https://atcoder.jp/contests/abc338/tasks/abc338_d

def solve(io)
  n, m = io.get2
  x = io.get_a(m).map(&.- 1)

  a = Array.new(n+1, 0_i64)
  b = Array.new(n+1, 0_i64)

  ml = 0_i64
  x.each_cons(2) do |(xi, xj)|
    xi, xj = xj, xi if xi > xj
    l1 = xj - xi
    l2 = n - l1
    if l1 < l2
      ml += l1
      a[xi] += 1
      a[xj] -= 1
      b[xi] += l1
      b[xj] -= l1
    else
      ml += l2
      a[0] += 1
      a[xi] -= 1
      a[xj] += 1
      a[n] -= 1
      b[0] += l2
      b[xi] -= l2
      b[xj] += l2
      b[n] -= l2
    end
  end

  n.times do |i|
    a[i+1] += a[i]
    b[i+1] += b[i]
  end

  io.put n.times.map { |i| ml + a[i] * n - b[i] * 2 }.min
end

require "procon"

solve(ProconIO.new)