require './pieces.rb'

class King < Piece

  def initialize(color, position)
    @moves = [[1,1],[1,-1],[-1,1],[-1,-1],[1,0],[-1,0],[0,1],[0,-1]]
    super
  end

  def piece
    @color == 'w' ? '\u2654' : '\u265A'
  end

end
