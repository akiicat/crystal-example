print "input an integer: "
input = (gets || 0).to_i

fibonacci = [0, 1]

(0..input).each do |i|
  fibonacci << fibonacci[i - 1] + fibonacci[i - 2] if !fibonacci[i]?
  puts fibonacci[i]
end

