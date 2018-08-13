# lib/chess.rb
require './pieces.rb'
require './bishop.rb'
require './knight.rb'
require './queen.rb'
require './rook.rb'
require './pawn.rb'
require './king.rb'

class Chess
  attr_accessor :turns, :board

  def initialize
    @turns = 1
    @board = [[' ','A',' ','B',' ','C',' ','D',' ','E',' ','F',' ','G',' ','H'],
              ['1',Rook.new('b').piece,' ',Knight.new('b').piece,' ',Bishop.new('b').piece, ' ', Queen.new('b').piece,
               ' ',King.new('b').piece,' ',Bishop.new('b').piece,' ',Knight.new('b').piece, ' ',Rook.new('b').piece],
              ['2',Pawn.new('b').piece,' ',Pawn.new('b').piece,' ',Pawn.new('b').piece,' ',Pawn.new('b').piece,
               ' ',Pawn.new('b').piece,' ',Pawn.new('b').piece,' ',Pawn.new('b').piece,' ',Pawn.new('b').piece],
              ['3',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],
              ['4',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],
              ['5',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],
              ['6',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '],
              ['7',Pawn.new('w').piece,' ',Pawn.new('w').piece,' ',Pawn.new('w').piece,' ',Pawn.new('w').piece,
               ' ',Pawn.new('w').piece,' ',Pawn.new('w').piece,' ',Pawn.new('w').piece,' ',Pawn.new('w').piece],
              ['8',Rook.new('w').piece,' ',Knight.new('w').piece,' ',Bishop.new('b').piece, ' ', Queen.new('b').piece,
               ' ',King.new('w').piece,' ',Bishop.new('w').piece,' ',Knight.new('b').piece, ' ',Rook.new('b').piece]]
  end

  def is_black?
    @color == 'black'
  end

  def move(pos,tar)
    pos.convert == 'invalid' ? (return 'invalid') : pos = pos.convert
    tar.convert == 'invalid' ? (return 'invalid') : tar = tar.convert

    if @board[pos[0]][pos[1]].is_valid?(pos,tar) && tar.in_bounds?
      if tar.clear?
        @board[tar[0]][tar[1]] = @board[pos[0]][pos[1]]
        @board[pos[0]][pos[1]] = ' '
      else
        return 'blocked'
      end
    else
      return 'invalid'
    end
  end

  def convert(string)
    lib = {'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4,
           'E' => 5, 'F' => 6, 'G' => 7, 'H' => 8}

    arr = string.split("")
    if ('A'..'H').include?(arr[0]) && (1..8).include?(arr[1])
      return [arr[1]+1,lib[arr[0]*2]]
    else
      return "invalid"
    end
  end

  def clear?(tar)
    (@board[tar[0]][tar[1]] == ' ' ||
     @board[pos[0]][pos[1]].color != @board[tar[0]][tar[1]].color)
  end

  def in_bounds?(tar)
    tar.each{|t| t.between?(1, 8) }
  end

  def game
    puts @board[0]
    puts @board[1]
    puts @board[2]
    puts @board[3]
    puts @board[4]
    puts @board[5]
    puts @board[6]
    puts @board[7]
    puts @board[8]

    @turns % 2 != 0 ? (turn = "Black's turn"; col = 'b')
                    : (turn = "White's turn"; col = 'w')

    puts turn; puts "Example input: A2 A3"
    p '> '; choice = gets.chomp.upcase.split
    if choice.include?('SAVE')
#      save_game
    elsif choice.length != 2
      puts "Invalid choice"; game
    else
      if move(choice[0],choice[1]) == 'invalid'
        puts "Invalid choice"; game
      else
        if @board[choice[0].convert[0]][choice[0].convert[1]] == ' '
          puts "You cannot move an empty space!"; game
        elsif @board[choice[0].convert[0]][choice[0].convert[1]].color != col
          puts "You cannot move the other team's piece!"; game
        else
          move(choice[0],choice[1])
          @turns += 1; game
        end
      end
    end
=begin
    case choice
    when choice.include?('SAVE')                then save_game; game
    when choice.include?('QUIT')                then quit_game
    when choice.length != 2                     then puts "Invalid choice"; game
    when move(choice[0],choice[1]) == 'invalid' then puts "Invalid choice"; game
    when @board[choice[0].convert[0]][choice[0].convert[1]] == ' '
      puts "You cannot move an empty space!"; game
    when @board[choice[0].convert[0]][choice[0].convert[1]].color != col
      puts "You cannot move the other team's piece!"; game
    else
      move(choice[0],choice[1])
      @turns += 1; game
    end
=end
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
