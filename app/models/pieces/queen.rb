class Queen < Piece
  include DiagonalMovement, OrthogonalMovement

  def valid_moves
    strip_invalid(diagonal_moves) + strip_invalid(orthogonal_moves)
  end

end
