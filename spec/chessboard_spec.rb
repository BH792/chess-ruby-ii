require "spec_helper"

describe Chessboard do
  context "initialize" do
    it "it initializes with all pieces set" do
      chessboard = Chessboard.new
      expect(chessboard.board.length).to eq(64)
      expect(chessboard.board[0].class).to eq(Rook)
    end
  end
end
