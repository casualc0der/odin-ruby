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
    board = Board.new
    puts 'Welcome to tic tac toe'

    puts 'Player 1 (x) please enter your name'
    p1name = gets.chomp
    p1name.empty? ? p1name = 'Player1' : p1name
    player1 = Player.new(p1name, 'X')

    puts 'Player 2 (o) please enter your name'
    p2name = gets.chomp
    p2name.empty? ? p2name = 'Player2' : p2name
    player2 = Player.new(p2name, 'O')

    player1.toggle_turn
    puts board.player_guide
    current_player = nil

    loop do
      if player1.turn
        current_player = player1
      else
        current_player = player2
      end
      begin
        puts "#{current_player.name} make a move"
        x = gets.chomp.to_i
        board.insert_symbol(current_player.symbol, x)
        if Winconditon.winner?(board.squares)
          puts "#{current_player.name} wins!"
          puts board.surface
          exit
        else
          @max_turns -= 1
          if @max_turns.zero?
            puts 'its a draw!'
            exit
          end
          puts board.surface
          player1.toggle_turn
          player2.toggle_turn
        end
      rescue ArgumentError
      end
    end
  end
end
