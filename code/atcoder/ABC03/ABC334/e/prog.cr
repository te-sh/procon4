# URL: https://atcoder.jp/contests/abc334/tasks/abc334_e

def solve(io)
  h, w = io.get2
  s = io.get_c(h, String)

  b = MdArray.new(h+2, w+2, false)
  c = MdArray.new(h+2, w+2, -1)
  u = 0
  (0...h).each do |i|
    (0...w).each do |j|
      if s[i][j] == '#'
        b[i+1][j+1] = true
        c[i+1][j+1] = u
        u += 1
      end
    end
  end

  uf = AtCoder::DSU.new(u)
  (1..h).each do |i|
    (1..w).each do |j|
      if b[i][j]
        uf.merge(c[i][j], c[i-1][j]) if b[i-1][j]
        uf.merge(c[i][j], c[i+1][j]) if b[i+1][j]
        uf.merge(c[i][j], c[i][j-1]) if b[i][j-1]
        uf.merge(c[i][j], c[i][j+1]) if b[i][j+1]
      end
    end
  end

  r = Mint.new(0)
  m = Mint.new(0)
  (1..h).each do |i|
    (1..w).each do |j|
      unless b[i][j]
        m += 1
        t = [] of Int32
        t << uf.leader(c[i-1][j]).to_i32 if b[i-1][j]
        t << uf.leader(c[i+1][j]).to_i32 if b[i+1][j]
        t << uf.leader(c[i][j-1]).to_i32 if b[i][j-1]
        t << uf.leader(c[i][j+1]).to_i32 if b[i][j+1]
        r += 1 - t.uniq.size
      end
    end
  end

  io.put (r + uf.groups.size * m) // m
end

alias Mint = AtCoder::ModInt998244353

require "procon"
require "procon/md_array"
require "atcoder/mod_int"
require "atcoder/dsu"

solve(ProconIO.new)