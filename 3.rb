d = File.readlines("3.txt")
outs = [0,0,0,0,0]
d.each_with_index{|s,i| if(s[(i*1)%31] == "#") then outs[0] += 1 end }
d.each_with_index{|s,i| if(s[(i*3)%31] == "#") then outs[1] += 1 end }
d.each_with_index{|s,i| if(s[(i*5)%31] == "#") then outs[2] += 1 end }
d.each_with_index{|s,i| if(s[(i*7)%31] == "#") then outs[3] += 1 end }
d.each_with_index{|s,i| if(i % 2 == 0 and s[(i/2)%31] == "#") then outs[4] += 1 end }
puts outs
puts outs.inject(:*)