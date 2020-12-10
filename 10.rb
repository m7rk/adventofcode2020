d = (File.readlines("10.txt")).map(&:to_i).sort.each_cons(2).map {|b, a| b - a }
puts (1+d.count(-3)) * (1+d.count(-1))


