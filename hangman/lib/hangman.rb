require_relative 'serializer'
require_relative 'word_selector'

serializer = Serializer.new

class Donkey
  def initialize
    @legs = 4
    @head = 1
  end

  def to_s
    "Donkey: {legs => #{@legs}, head => #{@head} }"
  end
end

dopey = Donkey.new
serializer.serialize(dopey.to_s)

file = File.read('game.json')
data = serializer.deserialize(file)

p data['Donkey']['legs']
p data['head']
