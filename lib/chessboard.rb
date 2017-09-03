class Chessboard
  attr_reader :board

  def initialize
    @board = Array.new(64, nil)

    #set pawns
    for i in (8..15)
      @board[i] = Pawn.new("black",self)
    end
    for i in (48..55)
      @board[i] = Pawn.new("white",self)
    end

    #set other pieces
    black = [
      Rook.new("black",self),
      Knight.new("black",self),
      Bishop.new("black",self),
      Queen.new("black",self),
      King.new("black",self),
      Bishop.new("black",self),
      Knight.new("black",self),
      Rook.new("black",self),
    ]
    white = [
      Rook.new("white",self),
      Knight.new("white",self),
      Bishop.new("white",self),
      Queen.new("white",self),
      King.new("white",self),
      Bishop.new("white",self),
      Knight.new("white",self),
      Rook.new("white",self),
    ]
    for i in (0..7)
      @board[i] = black.shift
    end
    for i in (56..63)
      @board[i] = white.shift
    end

  end
end
