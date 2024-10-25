# URL: https://atcoder.jp/contests/abc340/tasks/abc340_c

def solve(io)
  n = io.get(Int64)
  memo = Hash(Int64, Int64).new
  io.put calc(memo, n)
end

def calc(memo : Hash(Int64, Int64), x : Int64) : Int64
  return 0_i64 if x == 1
  return memo[x] if memo.has_key?(x)
  y, z = x // 2, cdiv(x, 2)
  r = x + calc(memo, y) + calc(memo, z)
  memo[x] = r
  return r
end

require "procon"

solve(ProconIO.new)
