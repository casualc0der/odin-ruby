require_relative 'dictionary'
require 'pry'
class WordSelector
  attr_reader :word_to_guess
def initialize
  @dictionary = Dictionary.new
  @word_to_guess = ""
end

def specific(i)
  @dictionary.words[i]
end

def random
  binding.pry

  vetted_dic = @dictionary
          .words
          .select {|x| x.length > 5 && x.length < 12}
  vetted_dic[rand(vetted_dic.length)]
end




end