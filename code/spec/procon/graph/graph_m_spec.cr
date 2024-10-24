require "spec"
require "procon/graph/graph_m"

module GraphMSpec
  describe GraphM do
    g = GraphM(Int32).new(3)
    g.add_edge(0, 1, 2)
    g.add_edge_b(1, 2, 3)

    it { g.size.should eq 3 }
    it { g[0].should eq [0, 2, g.inf] }
    it { g[1].should eq [g.inf, 0, 3] }
    it { g[2].should eq [g.inf, 3, 0] }
  end
end
