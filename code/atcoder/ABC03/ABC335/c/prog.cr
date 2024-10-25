# URL: https://atcoder.jp/contests/abc335/tasks/abc335_c

def solve(io)
  n, q = io.get2

  a = Array.new(n) { |i| {i+1, 0} }.reverse

  q.times do
    qi = io.get
    case qi
    when 1
      c = io.get(String)
      p = a.last
      case c
      when "R"
        a << {p[0]+1, p[1]}
      when "L"
        a << {p[0]-1, p[1]}
      when "U"
        a << {p[0], p[1]+1}
      when "D"
        a << {p[0], p[1]-1}
      end
    when 2
      p = io.get
      io.put_a a[-p]
    end
  end
end

require "procon"

solve(ProconIO.new)
