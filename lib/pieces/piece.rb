class Piece
  include CoordMath

  attr_writer :board
  attr_reader :color, :moved

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
    @moved = true
  end

  def same_color?(potential_move)
    # returns true if the piece at location passed is the same color
    # must check potential_move is not nil before passing
    @board.board[potential_move[0]][potential_move[1]].color == self.color
  end

  def strip_same_color(potential_moves)
    potential_moves.select do |move|
      if @board.board[move[0]][move[1]]
        !same_color?(move)
      else
        true
      end
    end
  end

  def strip_invalid(potential_moves)
    strip_same_color(strip_invalid_coords(potential_moves))
  end

  def opposite_color
    color == "black" ? "white" : "black"
  end
end
