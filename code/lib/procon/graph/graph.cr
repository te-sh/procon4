# :::::::::::::::::::: procon/graph/graph
#
# グラフを表します
# 辺は隣接リスト構造を持ち, 重みは管理しません
#
class Graph
  alias Node = Int32

  #
  # コンストラクタ
  #
  def initialize(@size : Node)
    @g = Array(Array(Node)).new(@size) { [] of Node }
  end

  #
  # 頂点数を返します
  #
  getter size : Int32

  #
  # i 番目の頂点リストを返します
  #
  delegate :[], to: @g

  #
  # 頂点 u から頂点 v への有向辺を追加します
  #
  def add_edge(u : Node, v : Node)
    @g[u] << v
  end

  #
  # 頂点 u から頂点 v への有向辺および頂点 v から頂点 u への有向辺を追加します
  #
  def add_edge_b(u : Node, v : Node)
    @g[u] << v
    @g[v] << u
  end

  #
  # 頂点 u から BFS で頂点を列挙します
  # ブロックには {見付けた頂点, その前の頂点} の Tuple を渡します
  #
  def bfs(u : Node)
    b = Array.new(@size, false)
    yield u, -1
    b[u] = true
    q = Deque{u}
    until q.empty?
      v = q.shift
      @g[v].each do |w|
        next if b[w]
        yield w, v
        b[w] = true
        q.push(w)
      end
    end
  end
end
# ::::::::::::::::::::
