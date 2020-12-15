dirs = ["N",[-1,0],"W",[0,-1],"S",[1,0],"E",[0,1]]
pos = [0,0]
waypoint = [-1,10]

def arysum(a,b)
  return [a,b].transpose.map(&:sum) 
end

def aryrot(a,p)
  return [a[1] - p[0], -a[0] - p[1]]
end

a = [24,-346]
b = [21,244]



File.readlines("12.txt").each do |l|
  d = dirs.find_index(l[0])
  if d
    waypoint = arysum(waypoint, dirs[d+1].collect {|n| n * l[1..-1].to_i })
  elsif l[0] == "F"
    pos = arysum(pos, waypoint.collect {|n| n * l[1..-1].to_i })
  elsif l[0] == "R"
    (l[1..-1].to_i/90).times {waypoint = aryrot(waypoint,[0,0])}
  elsif l[0] == "L"
    (3 * (l[1..-1].to_i/90)).times {waypoint =  aryrot(waypoint,[0,0])}
  end
  puts pos.inspect
  puts waypoint.inspect
  puts "--"
  
end
puts pos[0].abs + pos[1].abs