class Game

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def start
    @on = true
    @current_player = @player1
  end

  def on
    @on
  end

  def on=(value)
    @on = value
  end

  def make_move

  end
end