require_relative 'cpu'

class HardCpu < Cpu

  def minimax(sets, bc, wc, prev)
  end




  def guessprotocol(wc, bc, turn)
    if (@sets.length <=  2)
        next_guess = @sets.last.to_s.split("").map {|x| x.to_i }
        next_guess
      end

    if turn == 1
        @previous_guesses << "1122"
        return @previous_guesses.last
    else
    if wc == 0 && bc == 0
        deleter
        @previous_guesses << @sets.first
        @previous_guesses.last
    elsif wc > 0 || bc > 0
        simple_selector
        strict_selector(bc)
        strict_selector(wc)
        next_guess = @sets[@sets.length/2]
        @sets.delete(@previous_guesses.last)
        @previous_guesses << next_guess
        @previous_guesses.last
    end
  end
end
end