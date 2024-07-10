# URL: https://atcoder.jp/contests/abc343/tasks/abc343_c

def solve(io)
  n = io.get(Int64)
  (0..10_i64 ** 6).reverse_each do |i|
    c = i ** 3
    if c <= n
      d = c.digits
      io.put_e c if d == d.reverse
    end
  end
end

require "procon"

solve(ProconIO.new)
