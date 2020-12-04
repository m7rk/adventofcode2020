d = File.read("4.txt").split("\n\n").count {
    |v|
    v.include?("byr") and 
    v.include?("iyr") and 
    v.include?("eyr") and 
    v.include?("hgt") and 
    v.include?("hcl") and 
    v.include?("pid") and 
    v.include?("ecl")  
    }
puts d.inspect
