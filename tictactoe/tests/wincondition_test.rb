require 'minitest/autorun'
require_relative '../game/wincondition'
require_relative '../game/board'

class WinconditonTest < Minitest::Test
  def setup
    @board = Board.new
  end
  def test_nil_if_no_winner_on_blank_board
    assert_nil Winconditon.winner(@board.squares)
  end
  def test_nil_if_no_winner_on_full_board
    @board.insert_symbol('X', 1)
    @board.insert_symbol('O', 0)
    @board.insert_symbol('X', 3)
    @board.insert_symbol('O', 2)
    @board.insert_symbol('X', 4)
    @board.insert_symbol('O', 5)
    @board.insert_symbol('X', 6)
    @board.insert_symbol('O', 7)
    @board.insert_symbol('X', 8)
    assert_nil Winconditon.winner(@board.squares)
  end

  def test_true_if_winner_012
    @board.insert_symbol('X', 0)
    @board.insert_symbol('X', 1)
    @board.insert_symbol('X', 2)
    assert_equal 'p1', Winconditon.winner(@board.squares)
  end
  def test_true_if_winner_345
    @board.insert_symbol('X', 3)
    @board.insert_symbol('X', 4)
    @board.insert_symbol('X', 5)
    assert_equal 'p1', Winconditon.winner(@board.squares)
  end
  def test_true_if_winner_678
    @board.insert_symbol('X', 6)
    @board.insert_symbol('X', 7)
    @board.insert_symbol('X', 8)
    assert_equal 'p1', Winconditon.winner(@board.squares)
  end
  def test_true_if_winner_036
    @board.insert_symbol('X', 0)
    @board.insert_symbol('X', 3)
    @board.insert_symbol('X', 6)
    assert_equal 'p1', Winconditon.winner(@board.squares)
  end
  def test_true_if_winner_147
    @board.insert_symbol('X', 1)
    @board.insert_symbol('X', 4)
    @board.insert_symbol('X', 7)
    assert_equal 'p1', Winconditon.winner(@board.squares)
  end
  def test_true_if_winner_258
    @board.insert_symbol('X', 2)
    @board.insert_symbol('X', 5)
    @board.insert_symbol('X', 8)
    assert_equal 'p1', Winconditon.winner(@board.squares)
  end
  def test_true_if_winner_642
    @board.insert_symbol('X', 6)
    @board.insert_symbol('X', 4)
    @board.insert_symbol('X', 2)
    assert_equal 'p1', Winconditon.winner(@board.squares)
  end
  def test_true_if_winner_048
    @board.insert_symbol('X', 0)
    @board.insert_symbol('X', 4)
    @board.insert_symbol('X', 8)
    assert_equal 'p1', Winconditon.winner(@board.squares)
  end #all squares are currently nil
end
