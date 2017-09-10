module CoordMath
  def add_offset(offset, location)
    [offset[0] + location[0], offset[1] + location[1]]
  end

  def add_offset_to_limit(offset, location, limit)
    coords = []

    for i in 1..limit
      coords << [offset[0] * i + location[0], offset[1] * i + location[1]]
    end

    coords
  end

  def multiply_offset(arr, int)
    arr.map { |x| x * int}
  end

  def strip_invalid_coords(arr)
    arr.select do |coords|
      valid_coord?(coords)
    end
  end

  def valid_coord?(coords)
    # returns true if coords refer to a square on the board
    coords[0] >= 0 && coords[0] <= 7 && coords[1] >= 0 && coords[1] <= 7
  end
end
