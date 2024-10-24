# URL: https://atcoder.jp/contests/abc333/tasks/abc333_d

def solve(io)
  n = io.get

  g = Graph.new(n)
  (n-1).times do
    u, v = io.get2; u -= 1; v -= 1
    g.add_edge_b(u, v)
  end

  t = g.tree(0)
  m = g[0].map { |v| t.subtree_size[v] }
  io.put m.sort[...-1].sum + 1
end

require "procon"

require "procon/graph/tree/tree"

solve(ProconIO.new)