# URL: https://atcoder.jp/contests/abc344/tasks/abc344_e

def solve(io)
  n = io.get
  a = io.get_a(n)

  l = LinkedList(Int32).new

  c = l.first_guard
  h = Hash(Int32, LinkedList::Node(Int32)).new
  a.each do |ai|
    item = c.add(ai)
    h[ai] = item
    c = item
  end

  q = io.get
  q.times do
    t = io.get
    case t
    when 1
      x, y = io.get2
      c = h[x]
      item = c.add(y)
      h[y] = item
    when 2
      x = io.get
      c = h[x]
      c.remove
      h.delete(x)
    end
  end

  io.put_a l
end

require "procon"
require "procon/data_structure/linked_list"

solve(ProconIO.new)
