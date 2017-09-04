require "spec_helper"

describe Bishop do
  before(:all) do
    @board = Chessboard.new
    @black_bishop = @board.board[0][2]
    @white_bishop = @board.board[7][2]
    @board.board[6][1] = nil
    @board.board[6][3] = nil
  end

  context "#valid_moves" do
    it "takes an array of current location and returns array of valid moves " do
      expect(@black_bishop.valid_moves.length).to eq(0)
      expect(@white_bishop.valid_moves).to include([6,1], [5,0], [6,3], [5,4])
      expect(@white_bishop.valid_moves.length).to eq(7)
    end

    it "supports all possible bishop moves" do
      @board.move([0,2],[3,3])
      expect(@black_bishop.valid_moves).to include([2,2], [2,4], [4,4], [5,5], [6,6], [4,2], [5,1], [6,0])
      expect(@black_bishop.valid_moves.length).to eq(8)
    end
  end
end
