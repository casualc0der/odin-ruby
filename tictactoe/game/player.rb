class Player
  attr_reader :name, :points
  def initialize(name)
    @name = name
    @points = 0
  end
  def add_point
    @points += 1
  end
  def reset_points
    @points = 0
  end
end