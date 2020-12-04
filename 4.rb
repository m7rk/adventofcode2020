puts File.read("4.txt").split("\n\n").map{|r| Hash[*r.split(/\s+|:/)]}.count{|r|
r["byr"].to_i.between?(1920,2002) &&
r["iyr"].to_i.between?(2010,2020) &&
r["eyr"].to_i.between?(2020,2030) &&
r["hgt"] && (r["hgt"].include?("cm") ? (150..193) : (59..76)).include?(r["hgt"].to_i) &&
r["hcl"] =~ /#[0-9a-f]{6}/ &&
["amb","blu","brn","gry","grn","hzl","oth"].include?(r["ecl"]) &&
r["pid"] =~ /^[0-9]{9}$/
}