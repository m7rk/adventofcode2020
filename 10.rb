d = ([0] + File.readlines("10.txt")).map(&:to_i).sort.reverse

def to_directed_graph(d)
  out = {}
  d.each do |e|
    out[e] = d.select{|v| v.between?(e+1, e+3)}
  end
  out
end

def paths_from_adapter(d, i, cache)
  return cache[i] if cache[i]
  return 1 if d[i].count == 0

  sum = 0
  
  count = d[i].each do |v|
    val = 0
    if (cache[v]) 
      val = cache[v]
    else
      val = paths_from_adapter(d,v,cache)
      cache[v] = val
    end

    sum += val
  end
  return sum
end

puts paths_from_adapter(to_directed_graph(d),0,{})