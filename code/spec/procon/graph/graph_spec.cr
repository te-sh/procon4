require "spec"
require "procon/graph/graph"

module GraphSpec
  describe Graph do
    g = Graph.new(3)
    g.add_edge(0, 1)
    g.add_edge_b(1, 2)

    it { g.size.should eq 3 }
    it { g[0].should eq [1] }
    it { g[1].should eq [2] }
    it { g[2].should eq [1] }
  end
end
