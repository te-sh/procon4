# URL: https://atcoder.jp/contests/abc345/tasks/abc345_e

def solve(io)
  n, k = io.get2
  c, v = io.get2_c(n, Int32, Int64)
  sv = v.sum

  dpv1 = MdArray.new(k+1, 2) { 0_i64 }
  dpc1 = MdArray.new(k+1, 2) { 0 }
  dpv2 = MdArray.new(k+1, 2) { 0_i64 }
  dpc2 = MdArray.new(k+1, 2) { 0 }
  dpv1[0][0] = sv
  dpc1[0][0] = -1

  n.times do |i|
    (k+1).times do |j|
      2.times do |m|
        if dpc1[j][m] != c[i]
          if dpv2[j][1] < dpv1[j][m] && dpc2[j][0] != c[i]
            dpv2[j][1] = dpv1[j][m]
            dpc2[j][1] = c[i]
          elsif dpv2[j][0] < dpv1[j][m] && dpc2[j][1] != c[1]
            dpv2[j][0] = dpv1[j][m]
            dpc2[j][0] = c[i]
          end
        end
        if dpv2[j][0] < dpv2[j][1]
          dpv2[j].reverse!
          dpc2[j].reverse!
        end
      end
    end

    k.times do |j|
      2.times do |m|
        if dpv2[j+1][1] < dpv1[j][m] - v[i] && dpc2[j+1][0] != dpc1[j][m]
          dpv2[j+1][1] = dpv1[j][m] - v[i]
          dpc2[j+1][1] = dpc1[j][m]
        elsif dpv2[j+1][0] < dpv1[j][m] - v[i] && dpc2[j+1][1] != dpc1[j][m]
          dpv2[j+1][0] = dpv1[j][m] - v[i]
          dpc2[j+1][0] = dpc1[j][m]
        end
        if dpv2[j+1][0] < dpv2[j+1][1]
          dpv2[j+1].reverse!
          dpc2[j+1].reverse!
        end
      end
    end

    dpv1, dpv2 = dpv2, dpv1
    dpc1, dpc2 = dpc2, dpc1
    (k+1).times do |j|
      dpv2[j].fill(0)
      dpc2[j].fill(0)
    end
  end

  if dpv1[k][0] == 0
    io.put -1
  else
    io.put dpv1[k][0]
  end
end

require "procon"

require "procon/md_array"

solve(ProconIO.new)
