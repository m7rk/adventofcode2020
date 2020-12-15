data = File.readlines("13.txt")[1].split(",").map(&:to_i)

data = data.slice_when { |i, j| i != 0 }.to_a
parsed = data.map{|d| [d[-1],d.count(0)]}
puts parsed.inspect

def findnext(i, inc, targ)
    return i if ((i + 1 + targ[1]) % targ[0]) == 0
    return findnext(i + inc, inc, targ)
end

i = parsed[0][1]
inc = parsed[0][0]

parsed[1..-1].each do |p|
  i = findnext(i, inc, p)
  inc *= p[0]
end
puts i