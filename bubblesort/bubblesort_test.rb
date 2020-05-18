require 'minitest/autorun'
require_relative 'bubblesort'


class TestBubble < Minitest::Test
  def test_only_accept_array
    assert_raises ArgumentError do
      Bubble.sort(1)
    end
  end
  def test_sorts_length_2_array
    assert_equal [1,2], Bubble.sort([2,1])
  end
  def test_sorts_length_3_array
    assert_equal [1,2,3], Bubble.sort([2,1,3])
  end
  def test_sorts_length_4_array
    assert_equal [1,2,3,4], Bubble.sort([2,1,3,4])
  end
  def test_sorts_length_500_array
    assert_equal (1..500).to_a, Bubble.sort((1..500).to_a.shuffle)
  end
  def test_sorts_char_array
    assert_equal ['a', 'b', 'c', 'd'], Bubble.sort(['b', 'a', 'c', 'd'])
  end
end