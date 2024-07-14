# URL: https://atcoder.jp/contests/abc340/tasks/abc340_d

def solve(io)
  n = io.get
  g = GraphW(Int64).new(n, 10_i64**18)
  (n-1).times do |i|
    a, b, x = io.get3; x -= 1
    g.add_edge(i, i+1, a)
    g.add_edge(i, x, b)
  end
  io.put g.dijkstra(0).dist[n-1]
end

require "procon"
require "procon/graph/graph"
require "procon/graph/dijkstra"

solve(ProconIO.new)