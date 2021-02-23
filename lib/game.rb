require_relative 'board.rb'
require_relative 'poe.rb'
require_relative 'game_state.rb'

class Game
  attr_reader :current_player
  attr_reader :game_state
  attr_reader :winner

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    @board = Board.new
    @current_player = @player1
    @game_state = GameState::ONGOING
  end

  def ongoing?
    @game_state == GameState::ONGOING
  end

  def won?
    @game_state == GameState::WIN
  end

  def draw?
    @game_state == GameState::DRAW
  end

  def print_board
    @board.print_board
  end

  def make_move(position)
    @board.make_move(position, @current_player.marker)
    update_game_state
    rotate_current_player if ongoing?
  end

  private

  def rotate_current_player
    @current_player = @current_player.equal?(@player1) ? @player2 : @player1
  end

  def update_game_state
    if @board.check_for_winning_combination(@current_player.marker)
      @game_state = GameState::WIN
      @winner = @current_player
    elsif @board.solved?
      @game_state = GameState::DRAW
    end
  end
end
