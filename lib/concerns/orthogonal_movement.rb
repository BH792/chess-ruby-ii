module OrthogonalMovement
  OFFSETS = [
    [0, 1],   # right
    [0, -1],  # left
    [1, 0],   # down
    [-1, 0],  # up
  ]

  def orthogonal_moves(max_spaces: 8, all_directions: true)
    offsets = orthongonal_direction_to_offset(all_directions)

    offsets.each_with_object([]) do |offset, array|
      for i in 1..max_spaces
        trace = add_offset_to_limit(offset, location, i)
        target = trace.pop

        break if !@board.all_empty?(trace)
        array << target
      end
    end
  end

  def orthongonal_direction_to_offset(direction)
    case direction
    when true
      OFFSETS
    when "up"
      [OFFSETS[3]]
    when "down"
      [OFFSETS[2]]
    end
  end
end
