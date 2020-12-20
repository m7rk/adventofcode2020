text = File.read("16.txt")

rules = text.split("\n\n")[0].split("\n")
mytx = text.split("\n\n")[1].split("\n")
nearbytx = text.split("\n\n")[2].split("\n").map{|n| n.split(",").map(&:to_i)}.flatten

rulesp = rules.map{|t| [t.split(" ")[-1] , t.split(" ")[-3]]}.flatten.map{|r| r.split("-").map(&:to_i)}

puts rulesp.inspect

def inrange(i, rulesp)
  return rulesp.any? {|r| (r[0]..r[1]).include?(i)}
end

puts nearbytx.reject{|r| inrange(r, rulesp)}.sum