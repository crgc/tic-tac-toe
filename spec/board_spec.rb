require 'rspec'
require './lib/board.rb'
require './lib/poe.rb'

describe Board do

  let(:board) { Board.new }
  let(:winning_matrix) { [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]] }

  describe "#check_for_winning_combinations" do
    context "when the combination is a winning combination" do
      it "returns true" do
        board.make_move(4, :X)
        board.make_move(5, :X)
        board.make_move(6, :X)

        expect(board.check_for_winning_combination(:X)).to be true
      end
    end

    context "when the combination is not a winning combination" do
      it "returns false" do
        board.make_move(1, :O)
        board.make_move(2, :O)
        board.make_move(7, :O)

        expect(board.check_for_winning_combination(:O)).to be false
      end
    end
  end

  describe "#solved?" do
    context "when the board is not full" do
      it "returns false" do
        board.make_move(1, :O)
        expect(board.solved?).to be false
      end
    end

    context "when the board is full" do
      it "returns true" do
        (1..9).each do |position|
          board.make_move(position, :O)
        end

        expect(board.solved?).to be true
      end
    end
  end

  describe "#make_move" do
    context "when the move is made on a position that is available" do
      it "returns the marker put on that position" do
        marker = board.make_move(1, :O)
        expect(marker).to eql(:O)
      end
    end

    context "when the move is made on a position that is occupied" do
      it "raises a PositionOccupiedError" do
        board.make_move(1, :O)

        expect { board.make_move(1, :X) }.to raise_error(PositionOccupiedError)
      end
    end
  end

  describe "#print_board" do
    context "when the board is empty" do
      it "returns a string representation of an empty tic-tac-toe board" do
        board_str = board.print_board

        expect(board_str).to_not be_nil
        expect(board_str).to_not include 'X'
        expect(board_str).to_not include 'O'
      end
    end

    context "when the board is not empty" do
      it "returns a string representation of the tic-tac-toe board which includes the markers played" do
        board.make_move(1, :X)
        board.make_move(2, :O)
        board_str = board.print_board

        expect(board_str).to_not be_nil
        expect(board_str).to include 'X'
        expect(board_str).to include 'O'
      end
    end
  end
end
