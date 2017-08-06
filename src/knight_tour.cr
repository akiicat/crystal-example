class Knight
  def self.travel(n, start)
    new(n, start).travel
  end

  def initialize(@n : Int32, @current : NamedTuple(x: Int32, y: Int32))
    @route = [@current]
  end

  def travel
    (@n ** 2 - 1).times do
      possible_steps = possible(@current)

      break if possible_steps.size == 0

      @current = hard(possible_steps)

      @route.push @current
    end
    @route
  end

  def possible(step)
    directions = [[-2, 1], [-1, 2], [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1]]
    directions.map { |dir|
      {
        x: step[:x] + dir[0],
        y: step[:y] + dir[1]
      }
    }.select { |s|
      visitable?(s)
    }
  end

  def visitable?(step)
    0 <= step[:x] < @n &&
    0 <= step[:y] < @n &&
    !@route.includes? step
  end

  def hard(steps)
    steps.min_by { |step| possible(step).size }
  end
end

n = 8
start = {x: 5, y: 6}

route = Knight.travel(n, start)
n.times do |i|
  n.times do |j|
    printf "%3d ", route.index({x: i, y: j}) || 0 + 1
  end
  puts
end
