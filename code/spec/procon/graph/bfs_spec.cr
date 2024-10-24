require "spec"
require "procon/graph/bfs"

module BfsSpec
  describe Bfs do
    g = Graph.new(9)
    g.add_edge_b(0, 1)
    g.add_edge_b(0, 2)
    g.add_edge_b(0, 4)
    g.add_edge_b(1, 3)
    g.add_edge_b(1, 8)
    g.add_edge_b(2, 5)
    g.add_edge_b(3, 7)
    g.add_edge_b(3, 8)
    g.add_edge_b(4, 8)
    g.add_edge_b(5, 6)
    g.add_edge_b(5, 8)
    g.add_edge_b(5, 6)
    g.add_edge_b(6, 7)

    it do
      g.bfs(0).to_a.should eq [
        {0, -1}, {1, 0}, {2, 0}, {4, 0}, {3, 1}, {8, 1}, {5, 2}, {7, 3}, {6, 5}
      ]
    end
  end
end