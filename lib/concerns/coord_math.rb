module CoordMath
  def add_offset(arr_a, arr_b)
    [arr_a[0] + arr_b[0], arr_a[1] + arr_b[1]]
  end

  def multiply_offset(arr, int)
    arr.map! { |x| x * int}
  end

  def strip_invalid_coords(arr)
    arr.select do |coords|
      coords[0] >= 0 && coords[0] <= 7 && coords[1] >= 0 && coords[1] <= 7
    end
  end
end
