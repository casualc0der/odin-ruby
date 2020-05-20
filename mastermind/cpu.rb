class Cpu
  attr_reader :previous_guesses
  attr_accessor :sets
    def initialize
      @sets = (1111..6666).to_a
      @sets.delete_if {|x| x.to_s.include?(0.to_s) }
      @sets.delete_if {|x| x.to_s.include?(7.to_s) }
      @sets.delete_if {|x| x.to_s.include?(8.to_s) }
      @sets.delete_if {|x| x.to_s.include?(9.to_s) }
      @sets.map! {|q| q.to_s}
      @previous_guesses = []
      @final_combo = []
    end
  
  ######## this is a mess ##############
  
    def deleter
      last_guess = @previous_guesses.last
      4.times do |i|
      @sets.delete_if {|x| x.include?(last_guess[i]) }
      end
    end
  
    #should take in a string and remove all entries in sets that do not include that number
    def simple_selector(t)
        new_set = []
        last_guess = @previous_guesses.last.split("")
        
        last_guess.length.times do |i|
        new_set << @sets.select {|x| x.include?(last_guess[i]) }
  
      end
  
    
   
      @sets = new_set.flatten.uniq
    end
  
    def black_selector(bc)
      new_set = []
      check_guess = @previous_guesses[-1].split("")
      last_guess = @previous_guesses.last.split("")
  
  
      z = last_guess.permutation(bc).to_a
      z.map! {|x| x.join + ("." * (4 - bc)) }
      blacks = z.map {|x| x.split('').permutation(4).to_a.uniq }
   
      blacks.length.times do |i|
        blacks[i].length.times do |j|
        rx = Regexp.new(blacks[i][j].join, true)
        new_set << @sets.select {|x| rx.match(x)}
  
      end
      end
     
      @sets = new_set.flatten.uniq
   
    end
  
    def white_selector(wc)
      
      new_set = []
      last_guess = @previous_guesses.last.split("")
  
      z = last_guess.permutation(wc).to_a
      z.map! {|x| x.join + ("." * (4 - wc)) }
      whites = z.map {|x| x.split('').permutation(4).to_a.uniq }
   
      whites.length.times do |i|
        whites[i].length.times do |j|
        rx = Regexp.new(whites[i][j].join, true)
        new_set << @sets.select {|x| rx.match(x)}
  
      end
      end
     
      @sets = new_set.flatten.uniq
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
          simple_selector(turn)
          black_selector(bc)
          white_selector(wc)
          next_guess = @sets[@sets.length/2]
          @sets.delete(@previous_guesses.last)
          @previous_guesses << next_guess
          @previous_guesses.last
      end
    end
  end
  
  
  end
  