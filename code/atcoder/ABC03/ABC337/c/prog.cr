# URL: https://atcoder.jp/contests/abc337/tasks/abc337_c

def solve(io)
  n = io.get
  a = io.get_a(n)

  a.map!(&.- 1)

  s = -1
  b = Array.new(n, -1)
  a.each_with_index do |ai, i|
    if ai == -2
      s = i
    else
      b[ai] = i
    end
  end

  i = 0
  r = Array.new(n, 0)
  until s == -1
    r[i] = s
    s = b[s]
    i += 1
  end

  io.put_a r.map(&.+ 1)
end

require "procon"

solve(ProconIO.new)
