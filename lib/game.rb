require_relative "board.rb"
require_relative "poe.rb"
require_relative "game_state.rb"

class Game
  attr_reader :current_player
  attr_reader :game_state

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    @board = Board.new
    @current_player = @player1
    @game_state = GameState::ONGOING
  end

  def is_ongoing
    @game_state == GameState::ONGOING
  end

  def is_won
    @game_state == GameState::WIN
  end

  def is_draw
    @game_state == GameState::DRAW
  end

  def print_board
    @board.print_board
  end

  def rotate_current_player
    @current_player = @current_player.equal?(@player1) ? @player2 : @player1
  end

  def evaluate_game_state
    if @board.check_for_winning_combination(@current_player.marker)
      @game_state = GameState::WIN
      @winner = @current_player
    else
      @game_state = GameState::DRAW if @board.is_solved?
    end
  end

  def make_move(position)
    puts "#{current_player} wants to place an #{current_player.marker} at position #{position}"
    @board.make_move(position, @current_player.marker)
    evaluate_game_state
    rotate_current_player if is_ongoing
  end

  def winner
    @winner
  end
end