# URL: https://atcoder.jp/contests/abc341/tasks/abc341_c

def solve(io)
  h, w, n = io.get3
  t = io.get(String)
  s = io.get_c(h, String)

  c = 0
  (1...h-1).each do |i|
    (1...w-1).each do |j|
      c += 1 if try_walk(s, t, i, j)
    end
  end
  io.put c
end

def try_walk(s, t, y, x)
  return false if s[y][x] == '#'
  t.each_char do |ti|
    case ti
    when 'L'
      x -= 1
    when 'R'
      x += 1
    when 'U'
      y -= 1
    when 'D'
      y += 1
    end
    return false if s[y][x] == '#'
  end
  return true
end

require "procon"

solve(ProconIO.new)
