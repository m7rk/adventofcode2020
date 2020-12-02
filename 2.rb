puts File.readlines("2.txt").map{|s| s.split(" ")}.count{|c| c[2].count(c[1][0]).between?(*c[0].split("-").map(&:to_i))}

