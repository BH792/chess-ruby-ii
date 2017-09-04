require "spec_helper"

describe Queen do
  before(:all) do
    @board = Chessboard.new
    @black_queen = @board.board[0][3]
    @white_queen = @board.board[7][3]
    @board.board[6][3] = nil
  end

  context "#valid_moves" do
    it "takes an array of current location and returns array of valid moves " do
      expect(@black_queen.valid_moves.length).to eq(0)
      expect(@white_queen.valid_moves).to include([6, 3], [5, 3], [4, 3], [3, 3], [2, 3], [1, 3])
      expect(@white_queen.valid_moves.length).to eq(6)
    end

    it "supports all possible queen moves" do
      @board.move([0,3],[3,3])
      expect(@black_queen.valid_moves).to include([3, 0], [3, 1], [3, 2], [3, 4], [3, 5], [3, 6], [3, 7], [2, 3], [4, 3], [5, 3], [6, 3], [7, 3], [2, 2], [2, 4], [4, 4], [5, 5], [6, 6], [4, 2], [5, 1], [6, 0])
      expect(@black_queen.valid_moves.length).to eq(20)
    end
  end
end
