class Bishop < Piece
  include DiagonalMovement

  def valid_moves
    strip_invalid(diagonal_moves)
  end
end
