require './pieces.rb'

class Knight < Piece

  def initialize(color, position)
    @moves = [[2,1],[2,-1],[-2,1],[-2,-1],[1,2],[1,-2],[-1,2],[-1,-2]]
    super
  end

  def piece
    @color = 'w' ? '\u2658' : '\u265E'
  end

end
