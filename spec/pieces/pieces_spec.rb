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
      piece = @board.board[2]
      expect(piece.location).to eq(2)
    end
  end

end
