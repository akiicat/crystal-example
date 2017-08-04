def hanoi(n, a, b, c)
  if n == 1
    [{from: a, to: c}]
  else
    hanoi(n - 1, a, c, b) + hanoi(1, a, b, c) + hanoi(n - 1, b, a, c)
  end
end

print "input an integer: "
input = (gets || 0).to_i

hanoi(input, "A", "B", "C").each do |move|
  puts "from #{move[:from]} to #{move[:to]}"
end

