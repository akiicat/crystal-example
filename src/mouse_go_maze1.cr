class Mouse
  def self.go(maze, start, goal)
    a = new(maze, goal)
    a.visit(start)
    a.route
  end

  getter :route

  def initialize(@maze : Array(Array(Int32)), @goal : NamedTuple(x: Int32, y: Int32))
    @route = [] of NamedTuple(x: Int32, y: Int32)
  end

  def visit(pt)
    if visitable? pt
      @route.push pt
      @route.pop if !goal? && !try_one_out pt
    end
    goal?
  end

  def visitable?(pt)
    @maze[pt[:x]][pt[:y]] == 0 && !@route.includes? pt
  end

  def goal?
    @route.includes? @goal
  end

  def try_one_out(pt)
    visit({x: pt[:x]    , y: pt[:y] + 1}) ||
    visit({x: pt[:x] + 1, y: pt[:y]    }) ||
    visit({x: pt[:x]    , y: pt[:y] - 1}) ||
    visit({x: pt[:x] - 1, y: pt[:y]    })
  end
end

maze = [
  [2, 2, 2, 2, 2, 2, 2],
  [2, 0, 0, 0, 0, 0, 2],
  [2, 0, 2, 0, 2, 0, 2],
  [2, 0, 0, 2, 0, 2, 2],
  [2, 2, 0, 2, 0, 2, 2],
  [2, 0, 0, 0, 0, 0, 2],
  [2, 2, 2, 2, 2, 2, 2]
]
from = {x: 1, y: 1}
to = {x: 5, y: 5}

Mouse.go(maze, from, to).each do |pt|
  maze[pt[:x]][pt[:y]] = 1
end

puts "can not find exit" if maze[5][5] == 0

maze.each do |row|
  row.each do |block|
    case block
    when 0 then print " "
    when 1 then print "◇"
    when 2 then print "█"
    end
  end
  puts
end

