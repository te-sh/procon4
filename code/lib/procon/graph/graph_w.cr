# :::::::::::::::::::: procon/graph/graph_w

#
# グラフを表します
# 辺は隣接リスト構造を持ち, 重みを管理します
#
class GraphW(T)
  alias Node = Int32
  DUMMY_NODE = -1

  #
  # 辺を表します
  #
  struct Edge(T)
    #
    # コンストラクタ
    #
    def initialize(@src : Node, @dst : Node, @wt : T)
    end

    #
    # 辺の始点および終点を返します
    #
    getter src : Node, dst : Node

    #
    # 辺の重みを返します
    #
    getter wt : T
  end
      
  #
  # コンストラクタ
  # inf は無限大の代用値です
  #
  def initialize(@size : Node, @inf = 10**9)
    @g = Array(Array(Edge(T))).new(@size) { [] of Edge(T) }
  end

  #
  # 頂点数を返します
  #
  getter size : Int32

  #
  # 無限大の代用値を返します
  #
  getter inf : T

  #
  # i 番目の辺リストを返します
  #
  delegate :[], to: @g

  #
  # 頂点 u から頂点 v への重み wt の有向辺を追加します
  #
  def add_edge(u : Node, v : Node, wt : T)
    @g[u] << Edge.new(u, v, wt)
  end

  #
  # 頂点 u から頂点 v への重み wt の有向辺および頂点 v から頂点 u への重み wt の有向辺を追加します
  #
  def add_edge_b(u : Node, v : Node, wt : T)
    @g[u] << Edge.new(u, v, wt)
    @g[v] << Edge.new(v, u, wt)
  end
end

# ::::::::::::::::::::
