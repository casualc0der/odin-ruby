require 'pry'

turn = 1
white_count = 0
black_count = 0
master = Array.new(4)
guesser = nil
mastermind = nil

class Player
  def guessprotocol
  end
end

class Human
  def guessprotocol(wc, bc, turn)
    player = ""
    player << gets.chomp
    return player
  end
end

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
    @simple_simon = []
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
    last_guess = @previous_guesses.last.split("")

    z = last_guess.permutation(bc).to_a
    z.map! {|x| x.join + ("." * (4 - bc)) }
    whites = z.map {|x| x.split('').permutation(4).to_a.uniq }
 
    whites.length.times do |i|
      whites[i].length.times do |j|
      rx = Regexp.new(whites[i][j].join, true)
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
p @sets.sort
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

#who will be guesser? 
# if the cpu is guessing, the player must set the master array. If the player is guessing we must
# ask the cpu to create a random master array [1,1,1,1] > [6,6,6,6]
puts "Hello, do you wanna be guesser(g) or mastermind(m)?"
choice = gets.chomp
if choice == 'g'
  #mastermind = cpu
  #guesser = player

  guesser = Human.new
  # master = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)].join
  master = "1234"
else
  puts "please set array"
  #mastermind = player
  #guesser = cpu
  guesser = Cpu.new
  master = gets.chomp
  p master
end

class Engine
  def self.pegcounter(mstarr, guessarr)
    black = guessarr.split("").each_with_index.map {|x, i| mstarr[i] == x ? "black" : x }
    cputemp = mstarr.split("").each_with_index.map{|x, i| black[i] == "black" ? nil : x }
    white = black.each_with_index.map do |x, i| 
      if cputemp.include?(x)
        d = cputemp.index(x)
        cputemp[d] = nil
        "white"
      else
        nil
      end
    end
    black_count = black.count("black")
    white_count = white.count("white")
    return {black: black_count, white: white_count}
  end
end


  while black_count != 4
    puts "Turn #{turn}"
    guess_for_turn = guesser.guessprotocol(white_count, black_count, turn)
    mastermind = Engine.pegcounter(master, guess_for_turn)
    white_count = mastermind[:white]
    black_count = mastermind[:black]
    p "black = #{mastermind[:black]}"
    p "white = #{mastermind[:white]}"
    turn += 1
  end



