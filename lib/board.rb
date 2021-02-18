require_relative "grid.rb"
require_relative "poe.rb"

class Board

  GAME_STATE = {
    win = 1,
    draw = 2,
    ongoing = 3
  }
  @winning_combinations = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                           [1, 4, 7], [2, 5, 8], [3, 6, 9],
                           [1, 5, 9], [3, 5, 7]].freeze

  def initialize
    @grid = Grid.new
  end

  def make_move(position, marker)
    coordinates = @grid.coordinates_for_position(position)
    x = coordinates[0]
    y = coordinates[1]

    if @grid.position_is_empty(x, y)
      @grid.mark_position(x, y, marker)
    else
      raise PositionOccupiedError.new(position)
    end
  end

  def check_board(marker)
    @winning_combinations.each do |item|
      winner = @grid.grid.all? do |e|
        coordinates = @grid.coordinates_for_position(e)
        grid_elem = @grid.grid[coordinates[0]][coordinates[1]]
        return GAME_STATE[:win] unless grid_elem == marker
      end
    end

    @grid.any_positions_available? ? GAME_STATE[:ongoing] : GAME_STATE[:draw]
  end

  def print_board
    str_board = ""
    str_board = append_new_line(str_board)
    str_board = append_horizontal_border(str_board)
    str_board = append_new_line(str_board)

    @grid.grid.each_with_index do |x, xi|
      x.each_with_index do |y, yi|
        str_board = append_vertical_border(str_board)
        str_board = append_whitespace(str_board)
        str_board << (y.nil? ? ' ' : y.to_s)
        str_board = append_whitespace(str_board)
      end

      str_board = append_vertical_border(str_board)
      str_board = append_new_line(str_board)
      str_board = append_horizontal_border(str_board)
      str_board = append_new_line(str_board)
    end

    append_new_line(str_board)
  end

  def append_new_line(str)
    str << "\n"
  end

  def append_horizontal_border(str)
    str << " ——— ——— ———"
  end

  def append_vertical_border(str)
    str << "|"
  end

  def append_whitespace(str)
    str << " "
  end
end
