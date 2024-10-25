# :::::::::::::::::::: lib/graph/tree/tree
require "procon/graph/graph"
require "procon/graph/dfs"

#
# 木を実装します
#
module Tree
  alias Node = Graph::Node

  #
  # Parser を作成するファクトリーです
  #
  struct Factory
    #
    # コンストラクタ
    #
    def initialize(@g : Graph)
    end
  
    #
    # 木のパーサを返します
    #
    def parse(root : Node)
      Parser.new(@g, root).parse
    end
  end

  #
  # 木を作成する Parser です
  #
  class Parser
    #
    # コンストラクタ
    #
    def initialize(@g : Graph, @root : Node)
      @parent = Array.new(size, 0)
      @children = Array.new(size) { [] of Node }
      @depth = Array.new(size, -1)
      @dfs_order = [] of Node
      @subtree_size = Array.new(size, 1)
    end

    #
    # root を根とする木を作成します
    #
    def parse
      size = @g.size

      @g.dfs(@root).each do |u, p|
        @parent[u] = p
        @children[p] << u if u != @root
        @depth[u] = @depth[p] + 1
        @dfs_order << u
      end

      @dfs_order.reverse_each do |u|
        @subtree_size[@parent[u]] += @subtree_size[u] if u != @root
      end

      self
    end

    #
    # 頂点数を返します
    #
    delegate size, to: @g
    
    #
    # 根を返します
    #
    getter root : Node
    
    #
    # 木を DFS でたどったときの頂点の配列を返します
    #
    getter dfs_order : Array(Node)
    
    #
    # 親の頂点の配列を返します
    #
    getter parent : Array(Node)
    
    #
    # 子の頂点を配列の配列で返します
    #
    getter children : Array(Array(Node))
    
    #
    # 頂点深さを配列で返します
    #
    getter depth : Array(Int32)
    
    #
    # 部分木の頂点数を配列で返します
    #
    getter subtree_size : Array(Int32)
  end
end

class Graph
  def tree(root : Node)
    Tree::Factory.new(self).parse(root)
  end
end
# ::::::::::::::::::::
