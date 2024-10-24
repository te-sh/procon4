# URL: https://atcoder.jp/contests/abc332/tasks/abc332_d

INF = 10 ** 9

def solve(io)
  h, w = io.get2
  a = io.get_m(h, w)
  b = io.get_m(h, w)

  hp = (0...h).to_a.permutations(h).map(&.join)
  hh = hp.map_with_index { |hpi, i| {hpi, i} }.to_h
  hg = GraphW(Int32).new(hp.size)
  hp.each_with_index do |hpi, i|
    (0...h-1).each do |k|
      hpj = hpi[...k] + hpi[k...k+2].reverse + hpi[k+2...]
      j = hh[hpj]
      hg.add_edge(i, j, 1)
    end
  end
  hd = hg.dijkstra(0).dist

  wp = (0...w).to_a.permutations(w).map(&.join)
  wh = wp.map_with_index { |wpi, i| {wpi, i} }.to_h
  wg = GraphW(Int32).new(wp.size)
  wp.each_with_index do |wpi, i|
    (0...w-1).each do |k|
      wpj = wpi[...k] + wpi[k...k+2].reverse + wpi[k+2...]
      j = wh[wpj]
      wg.add_edge(i, j, 1)
    end
  end
  wd = wg.dijkstra(0).dist

  r = INF
  hp.each do |hpi|
    hi = hpi.chars.map(&.to_i)
    wp.each do |wpi|
      wi = wpi.chars.map(&.to_i)

      c = MdArray.new(h, w, 0)
      h.times do |j|
        w.times do |k|
          c[j][k] = a[hi[j]][wi[k]]
        end
      end

      min_u(r, hd[hh[hpi]] + wd[wh[wpi]]) if b.flatten == c.flatten
    end
  end

  io.put r == INF ? -1 : r
end

require "procon"

require "procon/md_array"

require "procon/graph/dijkstra"

solve(ProconIO.new)