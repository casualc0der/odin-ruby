class Player
  attr_reader :name, :turn
  def initialize(name)
    @name = name
    @turn = false
  end
  def toggle_turn
    @turn = !@turn
  end
end