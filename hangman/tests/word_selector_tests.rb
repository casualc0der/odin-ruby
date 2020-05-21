require 'minitest/autorun'
require_relative '../lib/word_selector'

class WordSelectorTest < Minitest::Test

  def setup
    @word = WordSelector.new
  end

    def test_pick_specific_word
      assert "Aachen", @word.specific(2)
    end

    def test_pick_random_word_between_5_12_chars
      assert (6..12), @word.random.length
    end


end