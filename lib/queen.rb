require './pieces.rb'
require './bishop.rb'
require './rook.rb'

class Queen < Piece

  def initialize(color, position)
    @moves = [Bishop.moves, Rook.moves].flatten
    super
  end

  def piece
    @color == 'w' ? '\u2655' : '\u265B'
  end

end
