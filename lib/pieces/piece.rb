class Piece
  attr_reader :color, :moved, :board

  def initialize(color, board)
    @color = color
    @moved = false
    @board = board
  end

  def location
    @board.board.each_index do |row|
      @board.board.each_index do |col|
        if @board.board[row][col] == self
          return [row,col]
        end
      end
    end
  end

  def has_moved
    @moved = false
  end
end
