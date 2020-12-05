def bs(input,d)
  return d[0]+1 if input.size == 0
  bs(input[1..-1], ["B","R"].include?(input[0]) ? [d[0]+((d[1]-d[0])/2),d[1]] : [d[0],d[1] - ((d[1]-d[0])/2)])
end

hsh = []
File.readlines("5.txt").map{|d| bs(d[0..6],[-1,128]) * 8 + bs(d[7..9],[-1,8]) }.each {|e| hsh << e }

puts (89...889).to_a - hsh.sort 