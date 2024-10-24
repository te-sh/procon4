require "spec"
require "procon/graph/tree/tree"

module TreeSpec
  describe Tree do
    g = Graph.new(9)
    g.add_edge_b(0, 1)
    g.add_edge_b(0, 2)
    g.add_edge_b(0, 3)
    g.add_edge_b(1, 4)
    g.add_edge_b(1, 5)
    g.add_edge_b(2, 6)
    g.add_edge_b(2, 7)
    g.add_edge_b(6, 8)

    t = g.tree(0)

    it { t.size.should eq 9 }
    it { t.root.should eq 0 }
    it { t.dfs_order.should eq [0, 3, 2, 7, 6, 8, 1, 5, 4] }
    it { t.parent.should eq [-1, 0, 0, 0, 1, 1, 2, 2, 6] }

    it do
      t.children.should eq [
        [3, 2, 1], [5, 4], [7, 6], [] of Int32, [] of Int32,
        [] of Int32, [8], [] of Int32, [] of Int32
      ]
    end

    it { t.depth.should eq [0, 1, 1, 1, 2, 2, 2, 2, 3] }
    it { t.subtree_size.should eq [9, 3, 4, 1, 1, 1, 2, 1, 1] }
  end
end
