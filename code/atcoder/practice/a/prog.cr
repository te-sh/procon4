# URL: https://atcoder.jp/contests/practice/tasks/practice_1

def solve(io)
    a = io.get(Int32)
    b, c = io.get2(Int32)
    s = io.get(String)

    io.put_a([a + b + c, s])
end

require "procon/io"

solve(ProconIO.new)
