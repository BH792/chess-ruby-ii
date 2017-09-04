require "spec_helper"

describe Pawn do
  before(:all) do
    @board = Chessboard.new
    @black_pawn = @board.board[1][0]
    @white_pawn = @board.board[6][0]
    @white_pawn_b = @board.board[6][2]
  end

  context "#valid_moves" do
    it "takes an array of current location and returns array of valid moves " do
      @board.move([1,1], [3,0])
      expect(@black_pawn.valid_moves).to include([2, 0])
      expect(@black_pawn.valid_moves.length).to eq(1)
      expect(@white_pawn.valid_moves).to include([5, 0], [4, 0])
      expect(@white_pawn.valid_moves.length).to eq(2)
    end

    it "supports all possible normal pawn moves" do
      @board.move([1,0], [4,1])
      @board.move([6,0], [5,0])
      @board.move([6,2], [5,2])
      expect(@black_pawn.valid_moves).to include([5,0], [5,2], [5,1])
      expect(@black_pawn.valid_moves.length).to eq(3)
    end
  end
end
