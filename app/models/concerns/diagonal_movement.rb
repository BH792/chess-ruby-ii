module DiagonalMovement
  OFFSETS = [
    [-1, -1], # up-left
    [-1, 1],  # up-right
    [1, -1],  # down-left
    [1, 1],   # down-right
  ]

  def diagonal_moves(max_spaces: 8, all_directions: true)
    offsets = diagonal_direction_to_offset(all_directions)

    offsets.each_with_object([]) do |offset, array|
      for i in 1..max_spaces
        trace = add_offset_to_limit(offset, location, i)
        target = trace.pop

        break if !@board.all_empty?(trace)
        array << target
      end
    end
  end

  def diagonal_direction_to_offset(direction)
    case direction
    when true
      OFFSETS
    when "up"
      OFFSETS[0,2]
    when "down"
      OFFSETS[2,2]
    end
  end
end
