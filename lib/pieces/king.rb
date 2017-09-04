class King < Piece
  include OrthogonalMovement, DiagonalMovement

  def valid_moves
    strip_invalid(diagonal_moves(max_spaces: 1)) + strip_invalid(orthogonal_moves(max_spaces: 1))
  end

  def in_check?
    opposing_pieces = @board.all_pieces(opposite_color)

    opposing_pieces.each do |piece|
      return true if piece.valid_moves.include?(location)
    end

    false
  end

  
end
