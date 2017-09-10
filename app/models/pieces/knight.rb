class Knight < Piece
  OFFSETS = [
    [2, 1], [2, -1],    # down left/right
    [-2, 1], [-2, -1],  # up left/right
    [1, 2], [-1, 2],    # right up/down
    [1, -2], [-1, -2],  # left up/down
  ]

  def valid_moves
    strip_invalid(
      OFFSETS.map do |offset|
        add_offset(offset, location)
      end
    )
  end

end
