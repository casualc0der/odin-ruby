class Player
  attr_reader :name, :points, :turn
  def initialize(name)
    @name = name
    @points = 0
    @turn = false
  end
  def add_point
    @points += 1
  end
  def reset_points
    @points = 0
  end
  def toggle_turn
    @turn = !@turn
  end
end