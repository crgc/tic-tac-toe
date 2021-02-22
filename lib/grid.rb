class Grid
  attr_reader :grid
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
  }.freeze

  def initialize
    @grid = Array.new(3) { Array.new(3) {} }
  end

  def fill_position(position, element)
    coordinates = coordinates_for_position(position)
    @grid[coordinates[0]][coordinates[1]] = element
  end

  def any_positions_available?
    (1..9).each { |position| return true if position_empty?(position) }
    false
  end

  def element_at_position(position)
    element_at_coordinates(coordinates_for_position(position))
  end

  def position_empty?(position)
    element_at_position(position).nil?
  end

  private
  def coordinates_for_position(position)
    COORDINATES[position]
  end

  def element_at_coordinates(coordinates)
    @grid[coordinates[0]][coordinates[1]]
  end
end
