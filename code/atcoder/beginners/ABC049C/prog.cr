# URL: https://atcoder.jp/contests/abs/tasks/arc065_a

def solve(io)
  s = io.get(String)
  s = s.reverse

  c = %w[dream dreamer erase eraser].map(&.reverse)

  until s.empty?
    f = c.find { |ci| s.starts_with?(ci) }
    io.put_e "NO" unless f
    s = s[f.size..]
  end

  io.put "YES"
end

require "procon"

solve(ProconIO.new)
