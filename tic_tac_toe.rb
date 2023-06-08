# frozen_string_literal: false

# Handles drawing the board and board manipulations, as well as checks for win
# state and cat's game.
class Board
  attr_accessor :board_positions

  def initialize
    @board_positions = Array.new(9) { |n| n + 1 }
  end

  def draw_board
    puts <<-BOARD
     #{@board_positions[0]} | #{@board_positions[1]} | #{@board_positions[2]}
    ---+---+---
     #{@board_positions[3]} | #{@board_positions[4]} | #{@board_positions[5]}
    ---+---+---
     #{@board_positions[6]} | #{@board_positions[7]} | #{@board_positions[8]}
    BOARD
  end

  def playable?(space)
    current_move.is_a? Integer
    @board_positions.include? current_move
    @board_positions[space] != 'X' || @board_positions != 'O'
  end

  def winner?
    horizontal_winner?
    vertical_winner?
    diagonal_winner?
  end

  def horizontal_winner?
    @board_positions[0..2].uniq.size == 1 ||
      @board_positions[3..5].uniq.size == 1 ||
      @board_positions[6..7].uniq.size == 1
  end

  def vertical_winner?
    @board_positions.values_at(0, 3, 6).uniq.size == 1 ||
      @board_positions.values_at(1, 4, 7).uniq.size == 1 ||
      @board_positions.values_at(2, 5, 8).uniq.size == 1
  end

  def diagonal_winner?
    @board_positions.values_at(0, 4, 8).uniq.size == 1 ||
      @board_positions.values_at(2, 4, 6).uniq.size == 1
  end

  def cats_game?
    @board_positions.all? { |position| position.is_a? String }
  end
end

# Stores player info such as score, name, and symbol.
class Player
  attr_accessor :name, :symbol, :score

  @@player_count = 0

  def initialize(name)
    @@player_count += 1
    @player_number = @@player_count
    @name = name
    @symbol = @player_number == 1 ? 'X' : 'O'
    @score = 0
  end
end

# Stores game loop functions, initializes with first prompts for players.
class Game
  def initialize
    puts "Let's play tic-tac-toe! Player 1, please enter your name!"
    p1_name = gets.chomp
    @p1 = Player.new(p1_name)
    puts 'Player 2, please enter your name!'
    p2_name = gets.chomp
    @p2 = Player.new(p2_name)
    @board = Board.new
  end

  def turn(player)
    @board.draw_board
    puts "#{player.name}'s turn. Make your move (input a number 1-9 and press enter)"
    move = gets.chomp.to_i
    until @board.playable?(move)
      @board.draw_board
      puts 'Invalid move, please try again.'
      move = gets.chomp.to_i
    end
    @board.board_positions[move - 1] = player.symbol
  end
end
