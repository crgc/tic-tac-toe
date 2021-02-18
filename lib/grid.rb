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

  def element_at_coordinates(coordinates)
    @grid[coordinates[0]][coordinates[1]]
  end

  def element_at_position(position)
    element_at_coordinates(coordinates_for_position(position))
  end

  def is_position_empty?(position)
    element_at_coordinates(coordinates_for_position(position)).nil?
  end

  def any_positions_available?
    (1..9).each { |position| return true if is_position_empty?(position)}
    false
  end

  def fill_position(position, element)
    coordinates = coordinates_for_position(position)
    @grid[coordinates[0]][coordinates[1]] = element
  end
end
