class Chessboard
  attr_reader :board

  def initialize
    @board = Array.new(8, Array.new(8, nil))

    #set pawns
    @board[1] = Array.new(8, Pawn.new("black",self))
    @board[6] = Array.new(8, Pawn.new("white",self))

    #set other pieces
    @board[0] = [
      Rook.new("black",self),
      Knight.new("black",self),
      Bishop.new("black",self),
      Queen.new("black",self),
      King.new("black",self),
      Bishop.new("black",self),
      Knight.new("black",self),
      Rook.new("black",self),
    ]
    @board[7] = [
      Rook.new("white",self),
      Knight.new("white",self),
      Bishop.new("white",self),
      Queen.new("white",self),
      King.new("white",self),
      Bishop.new("white",self),
      Knight.new("white",self),
      Rook.new("white",self),
    ]
  end

  def print
    puts @board.flatten.map { |e| e.class }
  end
end
