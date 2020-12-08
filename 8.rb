def make_alts(rom)
  out = []

  rom.each_with_index do |d,i|
    if(d[0] == "nop")
      alt = Marshal.load(Marshal.dump(rom))
      alt[i][0] = "jmp"
      out << alt
    end

    if(d[0] == "jmp")
      alt =  Marshal.load(Marshal.dump(rom))
      alt[i][0] = "nop"
      out << alt
    end
  end

  return out
end

def exec(acc,ptr,hsh,rom)
    return false if hsh[ptr]
    return acc if rom.count == ptr
    hsh[ptr] = true
    case rom[ptr][0]
      when "nop"
        ptr += 1
      when "jmp"
        ptr += rom[ptr][1]
      when "acc"
        acc += rom[ptr][1]; ptr +=1;
    end
    return exec(acc, ptr,hsh,rom)
end

alts = make_alts(File.readlines("8.txt").map{|m| [m.split(" ")[0],m.split(" ")[1].to_i]})

puts alts.map{|x| exec(0,0,{},x)}.uniq[1]