class Knight < Piece
  OFFSETS = [6, 10, 15, 17, -6, -10, -15, -17]

  def valid_moves
    potential_moves = OFFSETS.map { |e| e + location}
  end

end
