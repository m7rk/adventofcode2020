d = {}
r = File.read("7.txt").split("\n").map{|r| d[r.split("contain")[0].gsub!(/s|\s+/, '')] = r.split("contain")[1].split(",").map{|m| m.gsub!(/[0-9]|s|\.|\s+/, '')}}

k.keys.times do
    d.each do |k,v| if (v.include?("hinygoldbag") || (v.any?{|f| valid.include?(f)}))
            valid << k
        end
    end
end

puts valid.uniq.count