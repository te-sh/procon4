# URL: https://atcoder.jp/contests/abc339/tasks/abc339_c

def solve(io)
  n = io.get
  a = io.get_a(n, Int64)

  s = Array.new(n+1, 0_i64)
  a.each_with_index do |ai, i|
    s[i+1] = s[i] + ai
  end

  m = s.min
  if m < 0
    io.put -m+s.last
  else
    io.put s.last
  end
end

require "procon"

solve(ProconIO.new)