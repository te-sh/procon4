# URL: https://atcoder.jp/contests/abc333/tasks/abc333_e

def solve(io)
  n = io.get
  t, x = io.get2_c(n); x.map!(&.- 1)

  s = Array.new(n) { [] of Int32 }
  r = Array.new(n) { 0 }

  (0...n).each do |i|
    if t[i] == 1
      s[x[i]].push(i)
    end
  end

  (0...n).reverse_each do |i|
    if t[i] == 1
      s[x[i]].pop if !s[x[i]].empty? && s[x[i]].last == i
    elsif t[i] == 2
      if s[x[i]].empty?
        io.put_e -1
      else
        j = s[x[i]].pop
        r[j] = 1
      end
    end
  end

  k, mk = 0, 0
  (0...n).each do |i|
    if t[i] == 1
      k += r[i]
    elsif t[i] == 2
      k -= 1
    end
    max_u(mk, k)
  end

  io.put mk
  io.put_a (0...n).to_a.select { |i| t[i] == 1 }.map { |i| r[i] }
end

require "procon"

solve(ProconIO.new)