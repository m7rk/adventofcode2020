mask = 0
mem = {}

def bit_and(a,b)
  out = []
  puts "A" + a.inspect
  puts "B" + b.inspect
  a.count.times do |v|
    out << ((a[v] == "X") ? b[v] : a[v])
  end
  puts "O" + out.inspect
  out
end

def padleft(a, n, x)
  Array.new([0, n-a.length].max, x)+a
end

File.readlines("14.txt").each do |l|
  param = l.split(" ")
  if(param[0] == "mask")
    mask = param[2].chars
  else
    mem[param[0][4..-1].to_i] = bit_and(mask,param[2].to_i.to_s(2).rjust(36,"0").chars)
  end
end

puts mem.values.map{|v| v.join("").to_i(2)}.sum
