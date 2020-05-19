require 'minitest/autorun'
require_relative '../game/tictactoe'

class TicTacToeTests < Minitest::Test

  def setup 
    @player1 = Player.new("Edd")
    @player2 = Player.new("Tom")
    @game = TicTacToe.new(@player1, @player2)
  end

end