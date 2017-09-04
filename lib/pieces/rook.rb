class Rook < Piece
  include OrthogonalMovement

  def valid_moves
    strip_invalid(orthogonal_moves)
  end
end
