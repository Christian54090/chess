require './pieces.rb'

class Pawn < Piece

  def initialize(color, position)
    @moves = []
    super
  end

  def piece
    @color == 'w' ? '\u2659' : '\u265F'
  end

end
