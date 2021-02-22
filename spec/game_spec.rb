require 'rspec'
require './lib/game.rb'
require './lib/game_state.rb'

describe Game do
  let(:player1) { Player.new('Juan', :X) }
  let(:player2) { Player.new('Carlos', player1.opposite_marker) }
  let(:game) { Game.new(player1, player2) }

  describe "#start" do
    it "starts the game" do
      game.start

      expect(game.current_player).to eql(player1)
      expect(game.game_state).to eql(GameState::ONGOING)
    end
  end

  describe "#ongoing?" do
    it "returns true if the game is ongoing" do
      game.start

      expect(game.ongoing?).to be true
    end
  end

  describe "#won?" do
    it "returns true if the game is won" do
      game.start
      game.make_move(1)
      game.make_move(4)
      game.make_move(2)
      game.make_move(5)
      game.make_move(3)

      expect(game.won?).to be true
    end
  end

  describe "#draw?" do
    it "returns true if the game is a draw" do
      game.start
      game.make_move(1)
      game.make_move(5)
      game.make_move(2)
      game.make_move(3)
      game.make_move(7)
      game.make_move(4)
      game.make_move(6)
      game.make_move(8)
      game.make_move(9)

      expect(game.draw?).to be true
    end
  end

  describe "#make_move" do
    it "makes a move on the board" do
      game.start
      game.make_move(1)

      expect(game.current_player).to eql(player2)
    end
  end
end
