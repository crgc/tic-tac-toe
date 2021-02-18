class Grid

  COORDINATES = {
    1 => [0, 0],
    2 => [0, 1],
    3 => [0, 2],
    4 => [1, 0],
    5 => [1, 1],
    6 => [1, 2],
    7 => [2, 0],
    8 => [2, 1],
    9 => [2, 2]
  }

  def initialize
    @grid = Array.new(3) {Array.new(3) {}}
  end

  def grid
    @grid
  end

  def coordinates_for_position(position)
    COORDINATES[position]
  end

  def position_is_empty(x, y)
    @grid[x][y].nil?
  end

  def mark_position(x, y, marker)
    @grid[x][y] = marker
  end
end