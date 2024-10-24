# URL: https://atcoder.jp/contests/abc339/tasks/abc339_b

def solve(io)
  h, w, n = io.get3
  m = MdArray.new(h, w, '.')

  i = j = 0
  d = 'U'

  n.times do
    case m[i][j]
    when '.'
      m[i][j] = '#'
      case d
      when 'U'
        d = 'R'
        j += 1
      when 'R'
        d = 'D'
        i += 1
      when 'D'
        d = 'L'
        j -= 1
      when 'L'
        d = 'U'
        i -= 1
      end
    when '#'
      m[i][j] = '.'
      case d
      when 'U'
        d = 'L'
        j -= 1
      when 'R'
        d = 'U'
        i -= 1
      when 'D'
        d = 'R'
        j += 1
      when 'L'
        d = 'D'
        i += 1
      end
    end

    if i < 0
      i = h-1
    elsif i >= h
      i = 0
    elsif j < 0
      j = w-1
    elsif j >= w
      j = 0
    end
  end

  m.each do |mi|
    io.put mi.join
  end
end

require "procon"
require "procon/md_array"

solve(ProconIO.new)