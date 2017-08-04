def fibonacci(n)
  if [0, 1].includes?(n)
    n
  else
    fibonacci(n - 1) + fibonacci(n - 2)
  end
end

print "input an integer: "
input = (gets || 0).to_i

(0..input).each do |i|
  puts fibonacci(i)
end

