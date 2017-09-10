class Pawn < Piece
  include OrthogonalMovement, DiagonalMovement

  def valid_moves
    if !moved
      pawn_orthogonal_movement(2) + pawn_diagonal_capture + pawn_en_passant
    else
      pawn_orthogonal_movement(1) + pawn_diagonal_capture + pawn_en_passant
    end
  end

  def pawn_direction
    color == "black" ? "down" : "up"
  end

  def pawn_diagonal_capture
    # first gets array containing two diagonal coords, strips invalid squares
    # from those, selects only squares that contain an opposing piece
    strip_invalid(
      diagonal_moves(max_spaces: 1, all_directions: pawn_direction)
      ).select { |square| !@board.empty?(square) && !same_color?(square)}
  end

  def pawn_orthogonal_movement(spaces)
    # first gets array containing vertical coord(s), strips invalid squares
    # from those, selects only squares that are empty
    strip_invalid(
      orthogonal_moves(max_spaces: spaces, all_directions: pawn_direction)
    ).select { |square| @board.empty?(square)}
  end

  def pawn_en_passant
    []
  end
end
