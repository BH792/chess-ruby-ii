class King < Piece
  include OrthogonalMovement, DiagonalMovement

  def valid_moves
    strip_invalid(
      diagonal_moves(max_spaces: 1) +
      orthogonal_moves(max_spaces: 1) +
      king_castle_moves
      )
  end

  def in_check?
    opposing_pieces = @board.all_pieces(opposite_color)

    opposing_pieces.each do |piece|
      return true if piece.valid_moves.include?(location)
    end

    false
  end

  def king_castle_moves
    if !moved
      row = color == "black" ? 0 : 7
      castle_moves = []

      castle_moves << [row, 2] if castle_queen_side_valid?([row, 0])
      castle_moves << [row, 6] if castle_king_side_valid?([row, 7])

      castle_moves
    else
      []
    end
  end

  def castle_queen_side_valid?(coords)
    @board.board[coords[0]][coords[1]] != nil &&
    @board.board[coords[0]][coords[1]].moved == false &&
    @board.all_empty?([[coords[0], 1], [coords[0], 2], [coords[0], 3]])
  end

  def castle_king_side_valid?(coords)
    @board.board[coords[0]][coords[1]] != nil &&
    @board.board[coords[0]][coords[1]].moved == false &&
    @board.all_empty?([[coords[0], 5], [coords[0], 6]])
  end
end
