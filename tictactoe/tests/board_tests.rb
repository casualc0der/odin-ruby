require 'minitest/autorun'
require_relative '../game/board'

class BoardTest < Minitest::Test
  #Do we need an instance of the board or a static class?

  def setup
    @board = Board.new
  end
  def test_board_should_have_9_squares
    assert_equal 9, @board.squares.length
  end
  def test_insert_symbol_at_index_0
    @board.insert_symbol('X', 0)
    assert_equal 'X', @board.squares[0]
  end
  def test_insert_symbol_at_index_4
    @board.insert_symbol('X', 4)
    assert_equal 'X', @board.squares[4]
  end
  def test_insert_symbol_at_index_8
    @board.insert_symbol('X', 8)
    assert_equal 'X', @board.squares[8]
  end
  def test_reject_if_symbol_not_x_or_o
    assert_raises ArgumentError do
      @board.insert_symbol('p', 0)
    end
  end
  def test_board_should_handle_all_cases_of_symbol
    @board.insert_symbol('x', 0)
    assert_equal 'X', @board.squares[0]
  end
  def test_cannot_overide_exisiting_symbol
    @board.insert_symbol('X', 0)
    assert_raises ArgumentError do
      @board.insert_symbol('O', 0)
    end
  end
  def test_cannot_specify_out_of_range
    assert_raises ArgumentError do
      @board.insert_symbol('X', 10)
    end
  end
end