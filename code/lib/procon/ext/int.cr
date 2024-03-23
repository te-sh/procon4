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
end
