module OrthogonalMovement
  OFFSETS = [
    [0, 1],   # right
    [0, -1],  # left
    [1, 0],   # down
    [-1, 0],  # up
  ]

  def orthogonal_moves(max_spaces: 8, all_directions: true)
    offsets = all_directions ? OFFSETS : OFFSETS[3]

    offsets.each_with_object([]) do |offset, array|
      for i in 1..8 do
        array.concat(add_offset(multiply_offset(offset, i), location))
      end
    end
  end

end
