class Piece
  attr_reader :color, :moved, :board

  def initialize(color, board)
    @color = color
    @moved = false
    @board = board
  end

  def location
    @board.index(self)
  end
end
