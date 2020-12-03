d = File.readlines("3.txt")
o = 0;
d.each_with_index{|s,i| if(s[(i*3)%31] == "#") then o += 1 end }
puts o 