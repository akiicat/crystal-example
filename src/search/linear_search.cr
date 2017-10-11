def search(number, des)
  number.size.times do |i|
    return i if number[i] == des
  end
  nil
end

number = [1, 2, 3, 4, 6, 7, 8, 9]
target = 2

pp number
pp target

find = search(number, target)
puts find ? "find the number #{target} on index #{find}" : "not find the number"
