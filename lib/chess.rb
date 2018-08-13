require './pieces.rb'

class Chess
  attr_accessor :turns, :board

  def initialize
    @turns = 1
    @board = [[' ','A',' ','B',' ','C',' ','D',' ','E',' ','F',' ','G',' ','H'],
              ['1',Rook.new('b',[1,1]).piece,' ',Knight.new('b',[2,1]).piece,' ',Bishop.new('b',[1,1]).piece, ' ', King.new('b',[1,1]).piece,
               ' ',Queen.new('b',[1,1]).piece,' ',Bishop.new('b',[1,1]).piece,' ',Knight.new('b',[1,1]).piece, ' ',Rook.new('b',[1,1]).piece],
              ['2',Pawn.new('b',[1,2]).piece,' ',Pawn.new('b',[1,2]).piece,' ',Pawn.new('b',[1,2]).piece,' ',Pawn.new('b',[1,2]).piece,
               ' ',Pawn.new('b',[1,2]).piece,' ',Pawn.new('b',[1,2]).piece,' ',Pawn.new('b',[1,2]).piece,' ',Pawn.new('b',[1,2]).piece,],
              ['3',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],
              ['4',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],
              ['5',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],
              ['6',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],
              ['7',Pawn.new('w',[1,2]).piece,' ',Pawn.new('w',[1,2]).piece,' ',Pawn.new('w',[1,2]).piece,' ',Pawn.new('w',[1,2]).piece,
               ' ',Pawn.new('w',[1,2]).piece,' ',Pawn.new('w',[1,2]).piece,' ',Pawn.new('w',[1,2]).piece,' ',Pawn.new('w',[1,2]).piece,],
              ['8',Rook.new('b',[1,1]).piece,' ',Knight.new('b',[2,1]).piece,' ',Bishop.new('b',[1,1]).piece, ' ', King.new('b',[1,1]).piece,
               ' ',Queen.new('b',[1,1]).piece,' ',Bishop.new('b',[1,1]).piece,' ',Knight.new('b',[1,1]).piece, ' ',Rook.new('b',[1,1]).piece]]
  end

  def is_black?
    @color == 'black'
  end

  def move(pos,tar)
    if tar.convert.is_valid? && tar.convert.in_bounds?
#      if tar.clear?
#        @board[tar[0]*2][tar[1]*2] = @board[pos[0]*2][pos[1]*2]
#        @board[pos[0]*2][pos[1]*2] = ' '
#      else
#        return 'blocked'
#      end
    else
#      return 'invalid'
    end
  end

  def convert(string)
    return string
#    lib = {'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4,
#           'E' => 5, 'F' => 6, 'G' => 7, 'H' => 8}
#    return [lib[string.split("")[1]], string.split("")[0]]
  end

  def clear?(pos)
#    if coords in array dont have anything then return true
#    if they do then if it shares the same color return 'friend' else return 'enemy'
  end

  def in_bounds?(tar)
    tar.each{|t| t.between?(1, 8) }
  end

=begin
  On new,
    create board display - editable
    create pieces on board - editable
    the colors of the pieces - only readable
    and the position of the pieces - editable

  On check color,
    check for color
    if not color, return false

  On color,
    depending on color
    gives sprite

  On move,
    checks if move is legal
    if legal, position = move

  On convert position,
    gets user input
    library of letters A-H
    converts letters to numbers
    returns new coordinates

  On game,
    if turns % 2 isn't 0, black goes
    gets user input
    checks user input to see if it is save game
    if not, move to coords
    add 1 to turns and return to game

  On main menu,
    displays main menu
    gets user input
    if user input is 1 sends new game
    if user input is 2 sends load game

  On new game,
    blah blah blah

  On load game,
    blah blah blah

  On save game,
    blah blah blah

=end
end
