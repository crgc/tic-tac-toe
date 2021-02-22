# spec/player_spec.rb
require 'rspec'
require './lib/player.rb'

describe Player do
  let(:player) { Player.new('Juan', :X) }

  describe "#to_s" do
    it "returns the name of the player" do
      expect(player.to_s).to eql('Juan')
    end
  end

  describe "#opposite_marker" do
    it "returns the marker opposite to the player's marker" do
      expect(player.opposite_marker).to eql(:O)
    end
  end
end
