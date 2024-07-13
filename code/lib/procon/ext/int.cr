# :::::::::::::::::::: procon/ext/int
#
# Int を拡張します
#
struct Int
  #
  # self/b を小数点以下切り上げで求めます
  #
  def cdiv(b : Int)
    (self + b - 1) // b
  end

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
end
# ::::::::::::::::::::
