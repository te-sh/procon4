# :::::::::::::::::::: procon/graph/dfs
require "procon/graph/graph"

#
# BFS を行う構造体です
#
class Dfs
  alias Node = Graph::Node

  #
  # コンストラクタ
  #
  def initialize(@g : Graph)
  end

  #
  # 頂点 u から DFS で頂点を列挙する Enumerator を返します
  #
  def run(u : Node)
    Enumerator.new(@g, u)
  end

  #
  # DFS の経過を保持する Enumerator です
  #
  class Enumerator
    alias Node = Graph::Node
    alias NodePair = {Node, Node}

    include Enumerable(NodePair)

    #
    # コンストラクタ
    #
    def initialize(@g : Graph, @u : Node)
    end

    #
    # 頂点 u から DFS で頂点を列挙します
    # ブロックには {見付けた頂点, その前の頂点} の Tuple を渡します
    #
    def each(&)
      b = Array.new(@g.size, false)
      q = Deque{NodePair.new(@u, -1)}
      b[@u] = true
      until q.empty?
        v, u = q.pop
        yield NodePair.new(v, u)
        @g[v].each do |w|
          next if b[w]
          b[w] = true
          q.push(NodePair.new(w, v))
        end
      end
    end
  end
end

class Graph
  def dfs(s : Node)
    Dfs.new(self).run(s)
  end
end
# ::::::::::::::::::::