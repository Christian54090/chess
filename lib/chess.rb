require './pieces.rb'

class Chess
  attr_accessor :board

  def initialize
    @board = [[' ','A',' ','B',' ','C',' ','D',' ','E',' ','F',' ','G',' ','H'],
              ['1',Piece.new('black',[1,1])]]
  end

  def is_black?
    @color == 'black'
  end

  def move(position,target)
    if target.convert.is_valid? # and !(target.is_blocked?)
      puts "valid"
#      target.is_blocked? ? raise error : position = target
    else
#      raise error
    end
  end

  def convert(string)
    return string
#    lib = {'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4,
#           'E' => 5, 'F' => 6, 'G' => 7, 'H' => 8}
#    return [lib[string.split("")[0]], string.split("")[1]]
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
