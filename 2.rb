puts File.readlines("2.txt").map{|s| s.split(" ")}.count{|c| 1 == c[0].split("-").count{ |n| c[1][0] == c[2][n.to_i-1]}}

