require "spec_helper"

describe Rook do
  before(:all) do
    @board = Chessboard.new
    @black_rook = @board.board[0][0]
    @white_rook = @board.board[7][0]
  end

  context "#valid_moves" do
    it "takes an array of current location and returns array of valid moves " do
      expect(@black_rook.valid_moves).to include()
      @board.board[6][0] = nil
      expect(@black_rook.valid_moves).to include([6,0],[5,0],[4,0],[3,0],[2,0])
    end

    it "supports all possible rook moves" do
      expect(@black_rook.valid_moves).to include([1,2], [1,4], [2,5], [4,5], [5,4], [5,2], [4,1], [2,1])
    end
  end
end
