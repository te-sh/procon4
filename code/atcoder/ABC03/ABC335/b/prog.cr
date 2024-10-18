# URL: https://atcoder.jp/contests/abc335/tasks/abc335_b

def solve(io)
  n = io.get

  (0..n).each do |x|
    (0..n).each do |y|
      (0..n).each do |z|
        io.put_a [x, y, z] if x + y + z <= n
      end
    end
  end
end

require "procon"

solve(ProconIO.new)