alias Position = NamedTuple(x: Int32, y: Int32)

def place_queens(col, row)
  return [[] of Position] of Array(Position) if row == 0

  row -= 1

  place_queens(col, row).map { |queens|
    (0...col).map { |c|
      {
        x: row,
        y: c
      }
    }.select { |q1|
      queens.all? { |q2|
        q1[:x] != q2[:x] && # same row
        q1[:y] != q2[:y] && # same col
        (q1[:x] - q2[:x]).abs != (q1[:y] - q2[:y]).abs # diagonal
      }
    }.map { |queen|
      queens.dup << queen
    } 
  }.reduce { |acc, i|
    acc + i
  }
end

n = ARGV.first?.try(&.to_i) || 8

num_solution = 0
place_queens(n, n).each do |queens|
  n.times do |i|
    n.times do |j|
      print queens.includes?({ x: i, y: j }) ? "Q " : "_ "
    end
    puts
  end
  puts
  num_solution += 1
end

puts "Solutions found: #{num_solution}"

