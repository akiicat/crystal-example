def combi(row, column)
  return 1 if column == 0
  combi(row, column - 1) * (row - column + 1) / column
end

print "input an integer: "
height = (gets || 0).to_i

height.times do |row|
  print " " * 3 * (height - row)
  (row + 1).times do |column|
    print "%6d" % combi(row, column)
  end
  puts
end

