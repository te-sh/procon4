# URL: https://atcoder.jp/contests/abc332/tasks/abc332_b

def solve(io)
  k, g, m = io.get3

  wg, wm = 0, 0
  k.times do
    if wg == g
      wg = 0
    elsif wm == 0
      wm = m
    else
      eg = g - wg
      if wm <= eg
        wg += wm
        wm = 0
      else
        wg = g
        wm -= eg
      end
    end
  end

  io.put_a [wg, wm]
end

require "procon"

solve(ProconIO.new)