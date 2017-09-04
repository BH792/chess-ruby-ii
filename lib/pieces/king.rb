class King < Piece
  include OrthogonalMovement, DiagonalMovement

  def valid_moves
    strip_invalid(diagonal_moves(max_spaces: 1)) + strip_invalid(orthogonal_moves(max_spaces: 1))
  end

  def in_check?
    
  end
end
