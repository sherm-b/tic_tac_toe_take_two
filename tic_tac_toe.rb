class Board
  
  def initialize
    @board_positions = Array.new(9) {|n| n+1}
  end

  def draw_board
    puts <<-board 
     #{@board_positions[0]} | #{@board_positions[1]} | #{@board_positions[2]}
    ---+---+---
     #{@board_positions[3]} | #{@board_positions[4]} | #{@board_positions[5]}
    ---+---+---
     #{@board_positions[6]} | #{@board_positions[7]} | #{@board_positions[8]}
    board
  end
end


