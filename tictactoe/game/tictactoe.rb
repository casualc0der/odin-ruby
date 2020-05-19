require_relative '../game/player'
require_relative '../game/board'
require_relative '../game/wincondition'
require 'pry'

class TicTacToe
  attr_accessor :max_turns
  def initialize
    @max_turns = 9
  end

  def gameloop
    winner = false
    board = Board.new
    puts "Welcome to tic tac toe"
    puts "Player 1 (x) please enter your name"
    player1 = Player.new(gets.chomp)
    puts "Player 2 (o) please enter your name"
    player2 = Player.new(gets.chomp)
    player1.toggle_turn
    puts board.surface

    current_player = player1 || player2
    
    while true
        while player1.turn
          begin 
            puts "player 1 make a move"
            x = gets.chomp.to_i
            board.insert_symbol('X', x)
            if Winconditon.winner?(board.squares)
              puts "player1 wins!"
              puts board.surface
              exit
            else 
              @max_turns -=1
              if @max_turns == 0
                puts "its a draw!"
                exit
              end
              puts board.surface
              player1.toggle_turn
              player2.toggle_turn
            end
          rescue ArgumentError
          end
        end
        while player2.turn
          begin 
            puts "player 2 make a move"
            o = gets.chomp.to_i
            board.insert_symbol('O', o)
            if Winconditon.winner?(board.squares)
              puts "player2 wins!"
              puts board.surface
              exit
            else 
              @max_turns -=1
              if @max_turns == 0
                puts "its a draw!"
                exit
              end
              puts board.surface
              player2.toggle_turn
              player1.toggle_turn
            end
          rescue ArgumentError
          end
        end
      end
    end
    end
  