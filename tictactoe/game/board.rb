require 'pry'

class Board
  attr_reader :squares
  def initialize
    @squares = Array.new(9)
  end
  def insert_symbol(symbol, square_pos)
    raise ArgumentError unless @squares[square_pos] == nil
    raise ArgumentError unless square_pos >= 0 && square_pos <= 8
    sanitize_symbol = symbol.upcase
    raise ArgumentError unless sanitize_symbol == 'X' || sanitize_symbol == 'O'
    @squares[square_pos] = sanitize_symbol
  end
  def surface 
    x = @squares.map {|x| cube_creator(x)}
    x.insert(3,"\n")
    x.insert(7,"\n")
    x.join
  end
  private
  def cube_creator(symbol)
    symbol = " " if symbol.nil?
    side = "|"
    bottom = " #{symbol} "
    side + bottom + side
  end
end

x = Board.new
x.insert_symbol('X', 0)
x.insert_symbol('O', 1)
x.insert_symbol('X', 2)
x.insert_symbol('X', 3)
x.insert_symbol('O', 4)
x.insert_symbol('X', 5)
x.insert_symbol('X', 6)
x.insert_symbol('O', 7)
x.insert_symbol('X', 8)
puts x.surface