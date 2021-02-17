require_relative "board.rb"
require_relative "poe.rb"

class Game
  attr_reader :current_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    @on = true
    @board = Board.new
    @current_player = @player1
  end

  def on
    @on
  end

  def on=(value)
    @on = value
  end

  def rotate_current_player
    @current_player = @current_player.equal?(@player1) ? @player2 : @player1
  end

  def make_move(position)
    puts "#{current_player} wants to place an #{current_player.marker} at position #{position}"
    @board.place_marker(@current_player.marker, position)
    rotate_current_player
  end
end