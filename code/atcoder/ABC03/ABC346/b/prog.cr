# URL: https://atcoder.jp/contests/abc346/tasks/abc346_b

def solve(io)
  w, b = io.get2
  wb = w + b

  s = "wbwbwwbwbwbw" * 20

  (0...s.size-wb).each do |i|
    t = s[i...i+wb]
    io.put_e "Yes" if t.count('w') == w && t.count('b') == b
  end

  io.put "No"
end

require "procon"

solve(ProconIO.new)
