require 'minitest/autorun'
require_relative '../lib/dictionary'

class DictionaryTest < Minitest::Test

  def setup
    @dictionary = Dictionary.new
  end

  def test_dictionary_should_load_dic_into_memory
    assert_equal 61406, @dictionary.words.length
  end
end