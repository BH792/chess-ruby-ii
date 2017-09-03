require "spec_helper"

describe Piece do
  before(:all) do
    @board = Chessboard.new
  end

  context "initialize" do
    it "initializes with color, moved, and board" do
      piece = Piece.new("white", nil)
      expect(piece.color).to eq("white")
    end
  end

  context "#location" do
    it "returns the current index location of the piece" do
      piece = @board.board[0][2]
      expect(piece.location).to eq([0,2])
    end
  end

  context "#has_moved" do
    it "sets moved instance variable to false" do
      piece = @board.board[0][2]
      piece.has_moved
      expect(piece.moved).to eq(false)
    end
  end
end
