# :::::::::::::::::::: procon/graph/dijkstra
require "procon/graph/graph"
require "procon/data_structure/heap"

#
# Dijkstra 法の計算結果を表します
#
class Dijkstra(T)
  alias Node = GraphW::Node
  alias Edge = GraphW::Edge
  DUMMY_NODE = -1

  #
  # コンストラクタ
  #
  def initialize(@g : GraphW(T))
    size = @g.size
    @dist = Array.new(size, @g.inf)
    @prev = Array.new(size, DUMMY_NODE)
  end

  #
  # s から各頂点への最短距離を計算します
  #
  def run(s : Node)
    @dist[s] = T.additive_identity
    se = Edge.new(DUMMY_NODE, s, T.new(0))
    h = Heap.new([se]) { |a, b| a.wt <=> b.wt }
    until h.empty?
      e = h.pop

      next if @prev[e.dst] != DUMMY_NODE
      @prev[e.dst] = e.src

      @g[e.dst].each do |f|
        w = e.wt + f.wt
        if w < @dist[f.dst]
          @dist[f.dst] = w
          h.push(Edge.new(f.src, f.dst, w))
        end
      end
    end
    self
  end

  #
  # 指定された頂点から各頂点への距離を配列で返します
  #
  getter dist : Array(T)

  # ---------- private methods

  @prev : Array(Node)
end

class GraphW(T)
  def dijkstra(s : Node)
    Dijkstra.new(self).run(s)
  end
end
# ::::::::::::::::::::
