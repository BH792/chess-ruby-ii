require "spec_helper"

describe Knight do
  before(:all) do
    @board = Chessboard.new
    @black_knight = @board.board[0][1]
    @white_knight = @board.board[7][1]
  end

  context "#valid_moves" do
    it "takes an array of current location and returns array of valid moves " do
      expect(@black_knight.valid_moves).to include([2,0], [2,2])
      expect(@white_knight.valid_moves).to include([5,0], [5,2])
    end

    it "supports all possible knight moves" do
      @board.board[3][3] = @board.board[0][1]
      @board.move([0,1],[3,3])
      @board.board[1][2] = nil
      @board.board[1][4] = nil
      expect(@black_knight.valid_moves).to include([1,2], [1,4], [2,5], [4,5], [5,4], [5,2], [4,1], [2,1])
      expect(@black_knight.valid_moves.length).to eq(8)
    end
  end
end
