require_relative "grid.rb"

class Board

  def initialize
    @grid = Grid.new
  end

  def make_move(position, marker)

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
        str_board << y
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
