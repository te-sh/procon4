# URL: https://atcoder.jp/contests/abc342/tasks/abc342_a

def solve(io)
  s = io.get(String)
  ('a'..'z').each do |c|
    io.put_e s.index!(c) + 1 if s.count(c) == 1
  end
end

require "procon"

solve(ProconIO.new)
