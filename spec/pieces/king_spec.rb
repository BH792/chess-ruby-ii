require "spec_helper"

describe King do

  context "#valid_moves" do
    before(:all) do
      @board = Chessboard.new
      @black_king = @board.board[0][4]
      @white_king = @board.board[7][4]
    end

    it "takes an array of current location and returns array of valid moves " do
      expect(@black_king.valid_moves.length).to eq(0)
      @board.board[6][4] = nil
      expect(@white_king.valid_moves).to eq([[6,4]])
    end

    it "supports all possible normal king moves" do
      @board.move([0,4], [3,3])
      expect(@black_king.valid_moves).to include([3, 2], [3, 4], [2, 3], [4, 3], [2, 2], [2, 4], [4, 2], [4, 4])
      expect(@black_king.valid_moves.length).to eq(8)
    end
  end

  context "#king_castle_moves" do
    before(:all) do
      @board = Chessboard.new
      @black_king = @board.board[0][4]
      @white_king = @board.board[7][4]
      [1, 2, 3, 5, 6].each do |col|
        @board.board[0][col] = nil
      end
      [1, 3, 6].each do |col|
        @board.board[0][col] = nil
      end
    end

    it "returns array of castling coordinates for both king & queen side" do
      expect(@black_king.king_castle_moves).to include([0,2], [0,6])
      expect(@black_king.king_castle_moves.length).to eq(2)
    end

    it "does not allow castling if a piece has moved" do
      @board.board[0][0].has_moved
      expect(@black_king.king_castle_moves).to eq([0,6])
      @black_king.has_moved
      expect(@black_king.king_castle_moves).to eq([])
    end

    it "does not allow castling if the path is blocked" do
      expect(@black_king.king_castle_moves).to eq([])
    end
  end

  context "#in_check?" do
    before(:all) do
      @board = Chessboard.new
      @black_king = @board.board[0][4]
      @white_king = @board.board[7][4]
    end

    it "returns false if the king is not in check" do
      expect(@white_king.in_check?).to eq(false)
    end

    it "returns true if the king is in check" do
      # knights can check
      @board.move([7, 6], [2, 5])
      expect(@black_king.in_check?).to eq(true)

      # can check orthogonally
      @board.board[2][5] = nil
      expect(@black_king.in_check?).to eq(false)
      @board.board[1][4] = nil
      @board.move([7, 7], [3, 4])
      expect(@black_king.in_check?).to eq(true)

      # can check diagonally
      @board.board[3][4] = nil
      expect(@black_king.in_check?).to eq(false)
      @board.board[1][3] = nil
      @board.move([7, 5], [2, 2])
      expect(@black_king.in_check?).to eq(true)
    end
  end
end
