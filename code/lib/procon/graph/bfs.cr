# :::::::::::::::::::: procon/graph/bfs

require "procon/graph/graph"

#
# BFS を実装します
#
module Bfs
  alias Node = Graph::Node
  alias NodePair = {Node, Node}

  #
  # Enumerator を作成するファクトリーです
  #
  struct Factory
    #
    # コンストラクタ
    #
    def initialize(@g : Graph)
    end

    #
    # 頂点 u から BFS で頂点を列挙する Enumerator を返します
    #
    def run(u : Node)
      Enumerator.new(@g, u)
    end
  end

  #
  # BFS の経過を保持する Enumerator です
  #
  class Enumerator
    include Enumerable(NodePair)

    #
    # コンストラクタ
    #
    def initialize(@g : Graph, @u : Node)
    end

    #
    # 頂点 u から BFS で頂点を列挙します
    # ブロックには {見付けた頂点, その前の頂点} の Tuple を渡します
    #
    def each(&)
      b = Array.new(@g.size, false)
      q = Deque{NodePair.new(@u, Graph::DUMMY_NODE)}
      b[@u] = true
      until q.empty?
        v, u = q.shift
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
  #
  # 頂点 s から BFS で頂点を列挙する Enumerator を返します
  #
  def bfs(s : Node)
    Bfs::Factory.new(self).run(s)
  end
end

# ::::::::::::::::::::
