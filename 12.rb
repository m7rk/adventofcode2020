dirs = ["N",[1,0],"W",[0,-1],"S",[-1,0],"E",[0,1]]
facing = 6
pos = [0,0]
File.readlines("12.txt").each do |l|
  d = dirs.find_index(l[0])
  if d
    pos = [pos, dirs[d+1].collect {|n| n * l[1..-1].to_i }].transpose.map(&:sum) 
  elsif l[0] == "F"
    pos = [pos, dirs[facing+1].collect {|n| n * l[1..-1].to_i }].transpose.map(&:sum) 
  elsif l[0] == "R"
    facing -= (2 * (l[1..-1].to_i/90))
  elsif l[0] == "L"
    facing += (2 * (l[1..-1].to_i/90))
  end
  facing = (facing + 8) % 8
  puts pos.inspect
  
end
puts pos[0].abs + pos[1].abs