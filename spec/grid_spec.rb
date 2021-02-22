require 'rspec'
require './lib/grid.rb'

describe Grid do
  let(:grid) { Grid.new }

  describe "#fill_position" do
    it "fills a position in the grid" do
      grid.fill_position(1, :X)

      expect(grid.grid[0][0]).to eql(:X)
    end
  end

  describe "#any_positions_available?" do
    context 'when the grid is empty' do
      it "returns true" do
        expect(grid.any_positions_available?).to be true
      end
    end

    context 'when the grid is full' do
      it "returns false" do
        (1..9).each do |position|
          grid.fill_position(position, :X)
        end

        expect(grid.any_positions_available?).to be false
      end
    end
  end

  describe "#element_at_position" do
    it "returns the element at the position" do
      grid.fill_position(1, :X)

      expect(grid.element_at_position(1)).to eql(:X)
    end
  end

  describe "#position_empty?" do
    context "when the position is empty" do
      it "returns true" do
        grid.fill_position(1, :X)

        expect(grid.position_empty?(2)).to be true
      end
    end

    context "when the position is occupied" do
      it "returns false" do
        grid.fill_position(1, :X)

        expect(grid.position_empty?(1)).to be false
      end
    end
  end
end
