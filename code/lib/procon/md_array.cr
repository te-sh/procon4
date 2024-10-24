# :::::::::::::::::::: procon/md_array
#
# 多次元配列を生成するモジュールです
#
module MdArray
  #
  # 多次元配列を生成します
  #
  macro new(*args, &block)
    {% if !block %}
      {% for arg, i in args[0...-2] %}
        Array.new({{arg}}) {
      {% end %}
      Array.new({{args[-2]}}, {{args[-1]}})
      {% for arg in args[0...-2] %}
        }
      {% end %}
    {% else %}
      {% for arg, i in args %}
        Array.new({{arg}}) { |_i{{i}}|
      {% end %}
      {% for block_arg, i in block.args %}
        {{block_arg}} = _i{{i}}
      {% end %}
      {{block.body}}
      {% for arg in args %}
        }
      {% end %}
    {% end %}
  end
end
# ::::::::::::::::::::
