# URL: https://atcoder.jp/contests/abc335/tasks/abc335_d

def solve(io)
  n = io.get

  b = MdArray.new(n+2, n+2, 0)
  (0..n+1).each do |i|
    b[0][i] = n+1
    b[n+1][i] = n+1
    b[i][0] = n+1
    b[i][n+1] = n+1
  end
  b[(n+1)//2][(n+1)//2] = -1

  c = 1
  s = {1, 1}
  d = {1, 0}
  loop do
    b[s[0]][s[1]] = c

    ns = {s[0]+d[0], s[1]+d[1]}
    case b[ns[0]][ns[1]]
    when -1
      break
    when 1..
      case d
      when {1, 0}
        d = {0, 1}
      when {0, 1}
        d = {-1, 0}
      when {-1, 0}
        d = {0, -1}
      when {0, -1}
        d = {1, 0}
      end
    else
      c += 1
      s = ns
    end
  end

  b = b[1...-1].map { |bi| bi[1...-1] }
  b.each do |bi|
    io.put_a bi.map { |bij| bij == -1 ? "T" : bij.to_s }
  end
end

require "procon"

require "procon/md_array"

solve(ProconIO.new)