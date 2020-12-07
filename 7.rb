d = {}
r = File.read("7.txt").split("\n").map{|r| d[r.split("contain")[0].gsub!(/s|\s+/, '')] = r.split("contain")[1].split(",").map{|m| m.gsub!(/s|\.|\s+/, '')}}
valid = []
def bcount(d,btype)
    return 0 if btype == "nootherbag"
    return 1 + d[btype].map{|m| m.to_i * bcount(d,m.gsub(/[0-9]+/,""))}.sum
end
puts bcount(d,"hinygoldbag") - 1