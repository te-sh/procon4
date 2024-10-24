require "spec"
require "procon/graph/graph_w"

module GraphWSpec
  describe GraphW do
    g = GraphW(Int32).new(3)
    g.add_edge(0, 1, 2)
    g.add_edge_b(1, 2, 3)

    it { g.size.should eq 3 }
    it { g[0].should eq [GraphW::Edge.new(0, 1, 2)] }
    it { g[1].should eq [GraphW::Edge.new(1, 2, 3)] }
    it { g[2].should eq [GraphW::Edge.new(2, 1, 3)] }
  end
end
