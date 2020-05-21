require 'minitest/autorun'
require_relative 'testbot'

class MastermindTest < Minitest::Test
attr_reader :game
  def setup
    @game = MastermindStress.new
    
  end
  def test_four_games_completed
    skip
    assert_equal 4, game.game_test(4)
  end
  def test_fifty_games_completed
    skip
    assert_equal 50, game.game_test(50)
  end
  def test_fivehundred_games_completed
    skip
    assert_equal 500, game.game_test(500)
  end
  def test_max_games_completed
    skip
    assert_equal 1296, game.game_test(1296)
  end
  def test_over_max_games_completed
    skip
    assert_raises ArgumentError do 
      game.game_test(2000)
    end
  end
  def test_can_retrieve_winning_turn_stats
    skip
    game.game_test(100)
    assert_equal 100, game.winning_turn.length
  end
  def test_win_percentage_should_be_14_percent_baseline_at_100_runs
    
    runs = 10
    game.game_test(runs)
    stats = game.winning_turn.select {|x| x <= 12 }.length
    assert_equal 14, ((stats.to_f / runs.to_f) * 100).to_i
    
  end
  def test_win_percentage_should_be_above_14_percent_baseline_at_100_runs_for_medium_cpu
    skip
    runs = 100
    game.game_test(runs)
    stats = game.winning_turn.select {|x| x <= 12 }.length
    assert_equal 14, ((stats.to_f / runs.to_f) * 100).to_i
    
  end
end