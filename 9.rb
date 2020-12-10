# im so sorry but one line is one line
targ = ([File.readlines("9.txt").map(&:to_i)] * File.readlines("9.txt").count).each_with_index.map{|e,i| (e[i-26..i-1].combination(2).map(&:sum).include? e[i]) ? false : e[i]}.uniq[27]

puts ([File.readlines("9.txt").map(&:to_i)] * File.readlines("9.txt").count).each_with_index.map{|e,i| sum = 0; n = i; while(sum < targ) do sum += e[n]; n+=1; end; sum == targ ? e[i..n-1].min + e[i..n-1].max : false}.uniq[1]

