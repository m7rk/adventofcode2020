targ = File.readlines("13.txt")[0].to_i
data = File.readlines("13.txt")[1].split(",").map(&:to_i)
tidx =  data.map{|d| d > 0 ? (d-(targ % d)) : targ}.each_with_index.min
id = data[tidx[1]]
puts tidx[0] * id