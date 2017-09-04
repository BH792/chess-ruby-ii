require "spec_helper"

describe Rook do
  before(:all) do
    @board = Chessboard.new
    @black_rook = @board.board[0][0]
    @white_rook = @board.board[7][0]
  end

  context "#valid_moves" do
    it "takes an array of current location and returns array of valid moves " do
      expect(@black_rook.valid_moves.length).to eq(0)
      @board.board[6][0] = nil
      expect(@white_rook.valid_moves).to include([6,0],[5,0],[4,0],[3,0],[2,0])
      expect(@white_rook.valid_moves.length).to eq(6)
    end

    it "supports all possible rook moves" do
      @board.move([0,0], [3,3])
      expect(@black_rook.valid_moves).to include([3, 0], [3, 1], [3, 2], [3, 4], [3, 5], [3, 6], [3, 7], [2, 3], [4, 3], [5, 3], [6, 3])
      expect(@black_rook.valid_moves.length).to eq(11)
    end
  end
end
