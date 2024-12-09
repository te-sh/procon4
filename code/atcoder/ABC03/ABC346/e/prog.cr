# URL: https://atcoder.jp/contests/abc346/tasks/abc346_e

def solve(io)
  h, w, m = io.get(Int64, Int64, Int32)
  t, a, x = io.get3_c(m)

  a1 = Set(Int32).new
  a2 = Set(Int32).new
  c1 = 0
  c2 = 0

  r = Hash(Int32, Int64).new { 0_i64 }

  t.zip(a, x).reverse_each do |ti, ai, xi|
    if ti == 1
      next if a1.includes?(ai)
      r[xi] += w - c2
      a1.add(ai)
      c1 += 1
    else
      next if a2.includes?(ai)
      r[xi] += h - c1
      a2.add(ai)
      c2 += 1
    end
  end

  r[0] += (h - c1) * (w - c2)

  r.keys.each do |key|
    r.delete(key) if r[key] == 0
  end

  io.put r.keys.size
  r.keys.sort.each do |key|
    io.put_a [key, r[key]]
  end
end

require "procon"

solve(ProconIO.new)
