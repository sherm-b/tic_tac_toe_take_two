# frozen_string_literal: false

# Handles drawing the board and board manipulations, as well as checks for win
# state and cat's game.
class Board
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
    space != 'X' || space != 'O'
  end
end

# Stores player info such as score, name, and symbol.
class Player
  @@player_count = 0

  def initialize(name)
    @@player_count += 1
    @player_number = @@player_count
    @name = name
    @symbol = player_number == 1 ? 'X' : 'O'
    @score = 0
  end
end
