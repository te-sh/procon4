# :::::::::::::::::::: procon/data_structure/linked_list

#
# 双方向の LinkedList を表します
#
class LinkedList(T)
  include Enumerable(T)

  #
  # 空の LinkedList を返します
  # 先頭と末尾には番兵が配置されています
  #
  def initialize
    @s = Node(T).new(nil)
    @e = Node(T).new(nil)
    @s.succ = @e
    @e.prev = @s
  end

  #
  # 先頭の番兵を返します
  #
  def first_guard
    @s
  end

  #
  # 末尾の番兵を返します
  #
  def last_guard
    @e
  end

  #
  # 値を順に返します
  #
  def each(&)
    c = @s.succ
    until c.last_guard?
      yield c.value
      c = c.succ
    end
  end

  #
  # LinkedList の各ノードを表します
  #
  class Node(T)
    #
    # コンストラクタ
    #
    def initialize(@value : T | Nil)
    end

    #
    # 先頭の番兵かどうかを返します
    #
    def first_guard?
      @prev == nil
    end

    #
    # 末尾の番兵かどうかを返します
    #
    def last_guard?
      @succ == nil
    end

    #
    # 現在のノードの後ろに新しいノードを追加します
    # 追加されたノードを返します
    #
    def add(value : T)
      item = Node.new(value)
      succ = self.succ
      item.prev = self
      item.succ = succ
      self.succ = item
      succ.prev = item
      item
    end

    #
    # 現在のノードを削除します
    #
    def remove
      self.prev.succ = self.succ
      self.succ.prev = self.prev
    end

    #
    # 現在のノードの値を返します
    # 番兵の場合はエラーとなります
    #
    getter! value

    #
    # 現在のノードの前と次のノードの取得と設定を行います
    # 番兵の場合は取得はエラーとなります
    #
    property! prev, succ

    # ---------- private methods

    @prev : Node(T) | Nil
    @succ : Node(T) | Nil
  end
end

# ::::::::::::::::::::
