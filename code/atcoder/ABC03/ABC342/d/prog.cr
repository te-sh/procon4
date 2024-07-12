# URL: https://atcoder.jp/contests/abc342/tasks/abc342_d

def solve(io)
  n = io.get
  a = io.get_a(n)

  nz = a.count(0)
  a.delete(0)

  d = a.map { |ai|
    AtCoder::Prime.prime_division(ai)
      .select { |fi| fi[1].odd? }
      .map { |fi| fi[0] }
  }

  h = Hash(Array(Int32), Int32).new { 0 }
  d.each do |f|
    h[f] += 1
  end

  c = h.values.map { |v| v.to_i64 * (v-1) // 2 }.sum

  c += (n.to_i64-1) * n // 2 - (n.to_i64 - nz - 1) * (n - nz) // 2

  io.put c
end

require "procon"
require "atcoder/prime"

solve(ProconIO.new)
