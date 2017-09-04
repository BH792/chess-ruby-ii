require "spec_helper"

describe King do
  before(:all) do
    @board = Chessboard.new
    @black_king = @board.board[0][4]
    @white_king = @board.board[7][4]
  end

  context "#valid_moves" do
    it "takes an array of current location and returns array of valid moves " do
      expect(@black_king.valid_moves.length).to eq(0)
      @board.board[6][4] = nil
      expect(@white_king.valid_moves).to eq([6,4])
    end

    it "supports all possible king moves" do
      @board.move([0,4], [3,3])
      expect(@black_king.valid_moves).to include([3, 2], [3, 4], [2, 3], [4, 3], [2, 2], [2, 4], [4, 2], [4, 4])
      expect(@black_king.valid_moves.length).to eq(11)
    end
  end
end
