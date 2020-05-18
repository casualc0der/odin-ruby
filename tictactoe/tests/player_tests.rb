require 'minitest/autorun'
require_relative '../game/player'


class PlayerTest < Minitest::Test

  def setup
    @player1 = Player.new("Edd")
    @player2 = Player.new("Tom")
  end
  def test_player_has_a_name
    assert_equal "Edd", @player1.name
    assert_equal "Tom", @player2.name
  end
  def test_players_start_with_0_points
    assert_equal 0, @player1.points
  end
  def test_add_points
    @player1.add_point
    assert_equal 1, @player1.points
  end
  def test_reset_points
    @player1.add_point
    assert_equal 1, @player1.points
    @player1.reset_points
    assert_equal 0, @player1.points
  end
end