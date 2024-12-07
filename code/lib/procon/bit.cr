# :::::::::::::::::::: procon/bit

#
# Int のビット関連の拡張です
#
struct Int
  #
  # i ビット目が 1 かどうかを返します
  #
  def bit?(i : Int)
    bit(i) == 1
  end

  #
  # i ビット目を 1 にした値を返します
  #
  def set_bit(i : Int)
    self | (self.class.new(1) << i)
  end

  #
  # i ビット目を 0 にした値を返します
  #
  def reset_bit(i : Int)
    self & ~(self.class.new(1) << i)
  end

  #
  # ビットの部分集合の Enumerator を返します
  #
  def bit_subsets
    BitSubsetsEnumerator.new(self)
  end

  #
  # ビットの包含集合の Enumerator を返します
  #
  def bit_supersets(m : Int32)
    BitSupersetsEnumerator.new(self, m)
  end
end

#
# ビットの部分集合を列挙する Enumerator です
#
class BitSubsetsEnumerator(T)
  include Enumerable(T)

  def initialize(@n : T)
  end

  def each(&)
    n = @n
    while n >= 0
      n &= @n
      yield n
      n -= 1
    end
  end
end

#
# ビットの包含集合を列挙する Enumerator です
#
class BitSupersetsEnumerator(T)
  include Enumerable(T)

  def initialize(@n : T, @m : Int32)
  end

  def each(&)
    n = @n
    while n < (T.new(1) << @m)
      yield n
      n = (n + 1) | @n
    end
  end
end

# ::::::::::::::::::::
