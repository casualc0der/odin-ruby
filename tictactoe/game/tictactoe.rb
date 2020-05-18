require_relative '../game/player'
require_relative '../game/board'
require_relative '../game/wincondition'

class TicTacToe
  attr_accessor :max_turns
  def initialize
    @max_turns = 9
  end

  def gameloop
    board = Board.new
    puts "Welcome to tic tac toe"
    puts "Player 1 (x) please enter your name"
    player1 = Player.new(gets.chomp)
    puts "Player 2 (o) please enter your name"
    player2 = Player.new(gets.chomp)
    player1.toggle_turn
    
      until Winconditon.winner
        while player1.turn
          begin 
            puts "player 1 make a move"
            x = gets.chomp.to_i
            board.insert_symbol('X', x)
            puts board.surface
            Winconditon.winner(board.squares)
            player1.toggle_turn
            player2.toggle_turn
          rescue ArgumentError
          end
        end
        while player2.turn
          begin 
            puts "player 2 make a move"
            o = gets.chomp.to_i
            board.insert_symbol('O', o)
            puts board.surface
            Winconditon.winner(board.squares)
            player2.toggle_turn
            player1.toggle_turn
          rescue ArgumentError
          end
        end
    end
  end
end