require_relative 'serializer'
require_relative 'word_selector'

serializer = Serializer.new

class Donkey
  def initialize
    @legs = 4
    @head = 1
  end

  def save_status(filename)
    donkey = {gameid: filename, legs: @legs, head: @head }
  end
end

dopey = Donkey.new
serializer.serialize(dopey.save_status('EddsGame'))

file = File.read('game.json')
data = serializer.deserialize(file)

p data.class
p data

