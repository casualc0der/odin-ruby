require 'pry'

class Board
  attr_reader :squares, :displayboard
  def initialize
    @squares = Array.new(9)
    @displayboard = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def insert_symbol(symbol, square_pos)
    unless @squares[square_pos - 1] == nil
      puts "***Choose an empty square***\n\n"
      raise ArgumentError
    end

    unless square_pos >= 1 && square_pos <= 9
      puts "***Enter a number from 1-9***\n\n"
      raise ArgumentError
    end
    sanitize_symbol = symbol.upcase
    raise ArgumentError unless sanitize_symbol == 'X' || sanitize_symbol == 'O'
    @squares[square_pos - 1] = sanitize_symbol
  end

  def surface
    x = @squares.map { |z| cube_creator(z) }
    x.insert(3, "\n")
    x.insert(7, "\n")
    x.join
  end

  def player_guide
    x = @displayboard.map { |z| cube_creator(z) }
    x.insert(3, "\n")
    x.insert(7, "\n")
    x.join
  end

  private

  def cube_creator(symbol)
    symbol = ' ' if symbol.nil?
    side = '|'
    bottom = " #{symbol} "
    side + bottom + side
  end
end
