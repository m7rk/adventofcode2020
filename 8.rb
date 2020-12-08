def exec(acc,ptr,hsh,rom)
    puts hsh
    return acc if hsh[ptr]
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
puts exec(0,0,{},File.readlines("8.txt").map{|m| [m.split(" ")[0],m.split(" ")[1].to_i]})