module DiagonalMovement
  OFFSETS = [
    [-1, -1], # up-left
    [-1, 1],  # up-right
    [1, -1],  # down-left
    [1, 1],   # down-right
  ]

  def diagonal_moves(max_spaces: 8, all_directions: true)
    offsets = all_directions ? OFFSETS : OFFSETS[0,2]

    offsets.each_with_object([]) do |offset, array|
      for i in 1..8
        trace = add_offset_to_limit(offset, location, i)
        target = trace.pop

        break if !@board.all_empty?(trace)
        array << target
      end
    end
  end
end
