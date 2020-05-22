class Dictionary
  attr_reader :words

  def initialize
    @words = []
    load
  end

  private

  def load
    File.foreach('./assets/dictionary.txt') { |line| @words << line.chomp }
  end
end
