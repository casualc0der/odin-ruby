#what do we need to serialize??
require 'json'
require 'pry'
#game_id
#turn number
#word -> master/secret
#word -> revealed

class Serializer
  #convert state to JSON
  def serialize(x)
    data = JSON.dump(x)
    File.write("game.json", data, mode: 'a')
  end

  def deserialize(file)
    JSON.parse(file)
  end

end