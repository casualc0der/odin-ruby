class Player
  attr_reader :name, :turn, :symbol
  def initialize(name, symbol)
    @name = name
    @turn = false
    @symbol = symbol
  end

  def toggle_turn
    @turn = !@turn
  end
end
