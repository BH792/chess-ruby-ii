require "spec_helper"

describe Knight do
  before(:all) do
    @board = Chessboard.new
    @black_knight = @board.board[0][1]
    @white_knight = @board.board[7][1]
  end

  context "#valid_moves" do
    it "returns an array of all valid move coordinates" do
      expect(@black_knight.valid_moves).to include([2,0], [2,2])
      expect(@white_knight.valid_moves).to include([5,0], [5,2])
    end
  end
end
