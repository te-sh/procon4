#
# 競技プログラミング用の読み書きを行います
#
class ProconIO
    #
    # コンストラクタ
    #
    def initialize(@ins : IO = STDIN, @outs : IO = STDOUT)
      @buf = IO::Memory.new("")
    end
  
    #
    # 型を指定して値を読み込みます
    #
    def get(k : T.class = Int32) forall T
      get_v(k)
    end
  
    #
    # 型を指定して複数の値を読み込みます
    #
    macro define_get
      {% for i in (2..9) %}
        def get({{ *(1..i).map { |j| "k#{j}".id } }})
          { {{ *(1..i).map { |j| "get(k#{j})".id } }} }
        end
      {% end %}
    end
    define_get
  
    #
    # 個数と型を指定して複数の値を読み込みます
    #
    macro define_getn
      {% for i in (2..9) %}
        def get{{i}}(k : T.class = Int32) forall T
          get({{ *(1..i).map { "k".id } }})
        end
      {% end %}
    end
    define_getn
  
    #
    # 型を指定して横に並んだ値を配列として読み込みます
    #
    def get_a(n : Int, k : T.class = Int32) forall T
      Array.new(n) { get_v(k) }
    end
  
    #
    # 型を指定して縦に並んだ値を配列として読み込みます
    #
    def get_c(n : Int, k : T.class = Int32) forall T
      get_a(n, k)
    end
  
    #
    # 型を指定して縦に並んだ複数の値をタプルの配列として読み込みます
    #
    macro define_get_t
      {% for i in (2..9) %}
        def get_t(n : Int, {{ *(1..i).map { |j| "k#{j}".id } }})
          Array.new(n) { get({{ *(1..i).map { |j| "k#{j}".id } }}) }
        end
      {% end %}
    end
    define_get_t
  
    #
    # 個数と型を指定して縦に並んだ複数の値をタプルの配列として読み込みます
    #
    macro define_getn_t
      {% for i in (2..9) %}
        def get{{i}}_t(n : Int, k : T.class = Int32) forall T
          get_t(n, {{ *(1..i).map { "k".id } }})
        end
      {% end %}
    end
    define_getn_t
  
    #
    # 型を指定して縦に並んだ複数の値を配列のタプルとして読み込みます
    #
    macro define_get_c
      {% for i in (2..9) %}
        def get_c(n : Int, {{ *(1..i).map { |j| "k#{j}".id } }})
          a = get_t(n, {{ *(1..i).map { |j| "k#{j}".id } }})
          { {{ *(1..i).map { |j| "a.map { |e| e[#{j-1}] }".id } }} }
        end
      {% end %}
    end
    define_get_c
  
    #
    # 個数と型を指定して縦に並んだ複数の値を配列のタプルとして読み込みます
    #
    macro define_getn_c
      {% for i in (2..9) %}
        def get{{i}}_c(n : Int, k : T.class = Int32) forall T
          get_c(n, {{ *(1..i).map { "k".id } }})
        end
      {% end %}
    end
    define_getn_c
  
    #
    # 型を指定して行列の値を読み込みます
    #
    def get_m(r : Int, c : Int, k : T.class = Int32) forall T
      Array.new(r) { get_a(c, k) }
    end
  
    #
    # 値を出力します
    #
    def put(*v)
      @outs.puts(*v)
    end
  
    #
    # 値を出力して終了します
    #
    def put_e(*v)
      put(*v)
      exit
    end
  
    #
    # 値を空白区切りで出力します
    #
    def put_a(*v)
      put_d(*v, delimiter: ' ')
    end
  
    #
    # 値を空白区切りで出力して終了します
    #
    def put_ae(*v)
      put_a(*v)
      exit
    end
  
    #
    # 値を改行区切りで出力します
    #
    def put_c(*v)
      put_d(*v, delimiter: '\n')
    end
  
    #
    # 値を改行区切りで出力して終了します
    #
    def put_ce(*v)
      put_c(*v)
      exit
    end
  
    #
    # 値を delimiter 区切りで出力します
    #
    def put_d(*v, delimiter)
      v.each_with_index do |vi, i|
        vi.each_with_index do |vij, j|
          @outs.print vij
          @outs.print delimiter if j < vi.size - 1
        end
        @outs.print delimiter if i < v.size - 1
      end
      @outs.puts
    end
  
    # ---------- private methods
  
    private def get_v(k : String.class); get_token; end
    private def get_v(k : Int32.class); get_token.to_i32; end
    private def get_v(k : Int64.class); get_token.to_i64; end
  
    private def get_token
      loop do
        token = @buf.gets(' ', chomp: true)
        break token unless token.nil?
        @buf = IO::Memory.new(@ins.read_line)
      end
    end
  end
  