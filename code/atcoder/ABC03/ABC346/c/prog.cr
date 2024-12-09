# URL: https://atcoder.jp/contests/abc346/tasks/abc346_c

def solve(io)
  n, k = io.get(Int32, Int64)
  a = io.get_a(n, Int64)

  a.sort!.uniq!

  r = k*(k+1)//2
  a.each do |ai|
    break if ai > k
    r -= ai
  end

  io.put r
end

require "procon"

solve(ProconIO.new)
