
data = File.read("15.txt").split(",").map(&:to_i)

while(data.length < 2020)
  i = data[data.length - 1]
  if data.count(i) > 1
    (data << (1 + data[0..-2].reverse.find_index(i)))
  else
    (data << 0)
  end
end
puts data[2019]