# URL: https://atcoder.jp/contests/abc340/tasks/abc340_b

def solve(io)
  q = io.get
  a = [] of Int32
  q.times do
    t, v = io.get2
    case t
    when 1
      a << v
    when 2
      io.put a[-v]
    end
  end
end

require "procon"

solve(ProconIO.new)