# URL: https://atcoder.jp/contests/abc331/tasks/abc331_c

def solve(io)
  n = io.get
  a = io.get_a(n, Int64)

  b = a.sort
  cb = CumulativeSum.new(b)

  r = a.map do |ai|
    j = b.bsearch_index { |bj| bj > ai }
    j.nil? ? 0 : cb[j..]
  end

  io.put_a r
end

require "procon"
require "procon/data_structure/cumulative_sum"

solve(ProconIO.new)
