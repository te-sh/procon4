# URL: https://atcoder.jp/contests/abc343/tasks/abc343_a

def solve(io)
  a, b = io.get2
  if a + b == 0
    io.put 1
  else
    io.put 0
  end
end

require "procon"

solve(ProconIO.new)
