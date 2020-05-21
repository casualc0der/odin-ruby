require_relative 'cpu'

class HardCpu < Cpu

  def minimax(s, bc, wc, prev)
    full_set = (1111..6666).to_a
    full_set.delete_if {|x| x.to_s.include?(0.to_s) }
    full_set.delete_if {|x| x.to_s.include?(7.to_s) }
    full_set.delete_if {|x| x.to_s.include?(8.to_s) }
    full_set.delete_if {|x| x.to_s.include?(9.to_s) }
    full_set.map! {|q| q.to_s}


    if s.length == 1
      return s.first
    else 
     # Create the set S of 1296 possible codes (1111, 1112 ... 6665, 6666)
     # Start with initial guess 1122 (Knuth gives examples showing that other first guesses such as 1123, 1234 do not win in five tries on every code)
     # Play the guess to get a response of coloured and white pegs.
     # If the response is four colored pegs, the game is won, the algorithm terminates.
     # Otherwise, remove from S any code that would not give the same response if it (the guess) were the code.
    
    #  minimax
    #  For each possible guess, that is, any unused code of the 1296 not just those in S, 
    #  calculate how many possibilities in S would be eliminated for each possible colored/white peg score. 
    #  The score of a guess is the minimum number of possibilities it might eliminate from S. 
    #  A single pass through S for each unused code of the 1296 will provide a hit count for each coloured/white peg score found; the coloured/white peg score with the highest hit count will eliminate the fewest possibilities; 
    #  calculate the score of a guess by using "minimum eliminated" = "count of elements in S" - (minus) "highest hit count". 
    #  From the set of guesses with the maximum score, select one as the next guess, choosing a member of S whenever possible.
      s[s.length/2]
      #

    end
    
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
        next_guess = minimax(@sets, bc, wc, @previous_guesses)
        @sets.delete(@previous_guesses.last)
        @previous_guesses << next_guess
        @previous_guesses.last
    end
  end
end
end