# lib/chess.rb
require 'yaml'
require_relative 'pieces'
require_relative 'chess_pieces/king'
require_relative 'chess_pieces/pawn'
require_relative 'chess_pieces/rook'
require_relative 'chess_pieces/queen'
require_relative 'chess_pieces/knight'
require_relative 'chess_pieces/bishop'


class Chess
  attr_accessor :turns, :board

  def initialize
    @turns = 0
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
              ['8',Rook.new('w').piece,' ',Knight.new('w').piece,' ',Bishop.new('w').piece, ' ', Queen.new('w').piece,
               ' ',King.new('w').piece,' ',Bishop.new('w').piece,' ',Knight.new('w').piece, ' ',Rook.new('w').piece]]
  end

  def move(pos,tar)
    return 'invalid' if in_bounds?(tar.split(""))
    convert(pos) == 'invalid' ? (return 'invalid') : pos = convert(pos)
    convert(tar) == 'invalid' ? (return 'invalid') : tar = convert(tar)

    if piece_shown(pos).is_valid?(pos,tar)
      if tar.clear?
        @board[tar[0]][tar[1]] = @board[pos[0]][pos[1]]
        @board[pos[0]][pos[1]] = ' '
      else
        return 'blocked'
      end
    else
      show = @board[pos[0]][pos[1]]
      print show
      return 'invalid'
    end
  end

  def piece_shown(pos)
    pos = @board[pos[0]][pos[1]]

    case pos
    when pos == Pawn.new('w').piece then return Pawn.new('w')
    when pos == Pawn.new('b').piece then return Pawn.new('b')
    when pos == King.new('w').piece then return King.new('w')
    when pos == King.new('b').piece then return King.new('b')
    when pos == Rook.new('w').piece then return Rook.new('w')
    when pos == Rook.new('b').piece then return Rook.new('b')
    when pos == Queen.new('w').piece then return Queen.new('w')
    when pos == Queen.new('b').piece then return Queen.new('b')
    when pos == Knight.new('w').piece then return Knight.new('w')
    when pos == Knight.new('b').piece then return Knight.new('b')
    when pos == Bishop.new('w').piece then return Bishop.new('w')
    when pos == Bishop.new('b').piece then return Bishop.new('b')
    else                 return ' '
    end
  end

  def convert(string)
    lib = {'A' => 1, 'B' => 2, 'C' => 3, 'D' => 4,
           'E' => 5, 'F' => 6, 'G' => 7, 'H' => 8}

    arr = string.split("")
    if ('A'..'H').include?(arr[0]) && (1..8).include?(arr[1].to_i)
      return [arr[1].to_i,(lib[arr[0]] * 2) - 1]
    else
      return "invalid"
    end
  end

  def clear?(pos,tar)
    (piece_shown(tar) == ' ' || piece_shown(pos).color != piece_shown(tar).color)
  end

  def in_bounds?(tar)
    ('A'..'H').include?(tar[0]) && (1..8).include?(tar[1])
  end

  def game
    @board[0].each{|a| print a }; puts " "
    @board[1].each{|a| print a }; puts " "
    @board[2].each{|a| print a }; puts " "
    @board[3].each{|a| print a }; puts " "
    @board[4].each{|a| print a }; puts " "
    @board[5].each{|a| print a }; puts " "
    @board[6].each{|a| print a }; puts " "
    @board[7].each{|a| print a }; puts " "
    @board[8].each{|a| print a }; puts " "

    @turns % 2 != 0 ? (turn = "Black's turn, "; col = 'b')
                    : (turn = "White's turn, "; col = 'w')

    puts "\nAt any point, type 'save' or 'quit' for those actions"
    print turn; puts "Example input: A2 A3"
    print '> '; choice = gets.chomp.upcase.split

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
  end

  def checkmate?(color)
    color == 'b' ? (anti = 'w') : (anti = 'b')
    quit_game("Checkmate!") if @board.include?(King.new(anti))
  end

  def stalemate?
    other = [Pawn.new('b'),Rook.new('b'),Queen.new('b'),Knight.new('b'),Bishop.new('b'),
             Pawn.new('w'),Rook.new('w'),Queen.new('w'),Knight.new('w'),Bishop.new('w')]
    quit_game("Stalemate!") if other.select{|n| @board.include?(n)}.length == 0
  end

  def main_menu
    puts "Please choose a number"
    puts "---------------"
    puts "[1] New Game\n[2] Load Game\n[3] Quit"
    puts "---------------"

    print '> '; choice = gets.chomp.to_i
    case choice
    when [1].include?(choice) then new_game
    when [1].include?(choice) then load_game
    when [1].include?(choice) then quit_game
    else                     puts "Hint: Pick from the numbers"; main_menu
    end
  end

  def new_game
    chess = Chess.new
    game
  end

  def save_game
    File.open("saves/game.yaml", 'w'){ |file| file.write(YAML::dump(self)) }
    puts "Game has been saved!"
  end

  def load_game
    if File.exist?("saves/game.yaml")
      save = YAML::load(File.read("saves/game.yaml"))
      @board = save.board
      puts "Welcome back!"; game
    else
      puts "No saved files exist"; main_menu
    end
  end


  def quit_game(string="")
    puts string
    exit(0)
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

game = Chess.new
game.game
