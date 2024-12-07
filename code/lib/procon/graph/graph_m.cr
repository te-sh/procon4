# :::::::::::::::::::: procon/graph/graph_m

#
# グラフを表します
# 辺は隣接行列構造を持ちます
#
class GraphM(T)
  alias Node = Int32

  #
  # コンストラクタ
  # inf は無限大の代用値です
  #
  def initialize(@size : Int32, @inf = 10**9)
    @g = Array.new(@size) { Array.new(@size, @inf) }
    @size.times do |i|
      @g[i][i] = T.zero
    end
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
  # i 番目の辺の重みの配列を返します
  #
  delegate :[], to: @g

  #
  # 頂点 u から頂点 v への重み wt の有向辺を追加します
  #
  def add_edge(u : Node, v : Node, wt : T)
    @g[u][v] = wt
  end

  #
  # 頂点 u から頂点 v への重み wt の有向辺および頂点 v から頂点 u への重み wt の有向辺を追加します
  #
  def add_edge_b(u : Node, v : Node, wt : T)
    @g[u][v] = @g[v][u] = wt
  end

  # ---------- private methods

  @g : Array(Array(T))
end

# ::::::::::::::::::::
