# URL: https://atcoder.jp/contests/abc345/tasks/abc345_d

require "bit_array"

def solve(io)
  n, h, w = io.get3
  a, b = io.get2_c(n)

  (0...n).to_a.each_permutation(n) do |o|
    oa = o.map { |oi| a[oi] }
    ob = o.map { |oi| b[oi] }

    [0, 1].each_repeated_permutation(n) do |p|
      io.put_e "Yes" if can_place(n, h, w, oa, ob, p)
    end
  end
  io.put "No"
end

def can_place(n, h, w, a, b, p)
  t = BitArray.new(h * w)
  p.each_with_index do |pi, i|
    f = t.index(false)
    return true if f == nil
    case pi
    when 0
      ai, bi = a[i], b[i]
      t, ok = try_place(t, h, w, ai, bi, f.not_nil!)
      return false unless ok
    when 1
      ai, bi = a[i], b[i]
      t, ok = try_place(t, h, w, bi, ai, f.not_nil!)
      return false unless ok
    end
  end
  return t.all?
end

def try_place(t, h, w, ai, bi, f)
  r, c = f // w, f % w
  return t, false if r + ai > h || c + bi > w || t[f, bi].any?
  ai.times do |i|
    t.fill(true, f + i * w, bi)
  end
  return t, true
end

require "procon"

solve(ProconIO.new)
