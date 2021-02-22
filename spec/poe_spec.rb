require 'rspec'
require './lib/game.rb'
require './lib/poe.rb'

describe PositionOccupiedError do
  let(:player1) { Player.new('Juan', :X) }
  let(:player2) { Player.new('Carlos', player1.opposite_marker) }
  let(:game) { Game.new(player1, player2) }

  describe '#position' do
    it 'returns the occupied position' do
      game.start
      game.make_move(1)

      begin
        game.make_move(1)
      rescue PositionOccupiedError => e
        expect(e.position).to eql(1)
      end
    end
  end
end
