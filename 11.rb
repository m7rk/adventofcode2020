def raycast(d,x,y,dx,dy)
  step = 1
  while((x+step*dx).between?(0,d.count-1) && (y+step*dy).between?(0,d[0].count-1))
    return d[x+step*dx][y+step*dy] if d[x+step*dx][y+step*dy] != "."
    step += 1
  end
  return "."
end

def newState(d,x,y)
  adj = []
  (-1..1).each do |dx|
    (-1..1).each do |dy|
      if !(dx == 0 && dy == 0)
        adj << raycast(d,x,y,dx,dy)
      end
    end
  end
  return "#" if d[x][y] == "L" && adj.count("#") == 0
  return "L" if d[x][y] == "#" && adj.count("#") >= 5
  return d[x][y]
end


def tick(d)
  out = []
  d.each_with_index do |l,x|
    out << []
    l.each_with_index do |c,y|
      out[x] << newState(d,x,y)
    end
  end
  out
end

st = File.readlines("11.txt").map(&:chomp).map(&:chars)
puts st.count
puts st[0].count
while(true)
  newst = tick(st)
  if(newst == st)
    puts st.flatten.count("#")
    return
  end
  st = newst
  puts st.flatten.count("#")
end
