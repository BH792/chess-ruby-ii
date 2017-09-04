class Chessboard
  include CoordMath
  attr_reader :board

  def initialize
    @board = Array.new(8) {Array.new(8, nil)}

    #set pawns
    @board[1] = Array.new(8) {Pawn.new("black",self)}
    @board[6] = Array.new(8) {Pawn.new("white",self)}

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

  def get_king(color)
    @board.flatten(1).detect { |piece| piece.class == King && piece.color == color}
  end

  def empty?(coords)
    # returns true of the space is empty
    # returns false if space is not empty or if the space is not on the board
    valid_coord?(coords) ? @board[coords[0]][coords[1]] == nil : false
  end

  def all_empty?(coords_array)
    coords_array.all? { |coords| empty?(coords) }
  end

  def move(cur_loc, new_loc)
    @board[new_loc[0]][new_loc[1]] = @board[cur_loc[0]][cur_loc[1]]
    @board[new_loc[0]][new_loc[1]].has_moved
    @board[cur_loc[0]][cur_loc[1]] = nil
  end

  def all_pieces(color)
    @board.flatten(1).compact.select { |piece| piece.color == color }
  end

# testing only
# TODO delete
  def print
    pp @board.map{|r| r.map { |c| c.class.to_s }}
  end
end
