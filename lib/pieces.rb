class Piece
  attr_accessor :x_pos, :y_pos
  attr_reader   :color, :moves

  def initialize(color, position)
    @moves = []
    @color = color
    @x_pos = position[0]
    @y_pos = position[1]
  end

  def is_valid?(pos,tar)
    res = []
    res << (pos[0] - tar[0])
    res << (pos[1] - tar[1])
    @moves.include?(res)
    # if move is within moves and is within board
    # return true
    # else return false
  end
=begin
  On new,
    takes position and color
    x coordinate = first val of position - editable
    y coordinate = second val of position - editable

  On legal moves,
    takes x and y
    depending on color and position on board,
    checks legal moves
    if move is legal,
    pushes move into an array
    if move is not legal,
    raises an error
=end
end
