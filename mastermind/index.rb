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
    player = []
    player << gets.chomp.to_i
    player << gets.chomp.to_i
    player << gets.chomp.to_i
    player << gets.chomp.to_i
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
    @sets.length
    @previous_guesses = []
  end

######## this is a mess ##############

  def guessprotocol(wc, bc, turn)
      p @sets.length
      p @previous_guesses
      if (@sets.length <=  2)
        next_guess = @sets.last.to_s.split("").map {|x| x.to_i }
        next_guess
      end
     if turn == 1
        @previous_guesses << [1,1,2,2]
        return [1,1,2,2]
     else
      if(wc == 0 && bc == 0)
        herp = @previous_guesses.last
        4.times do |i|
        @sets.delete_if {|x| x.to_s.include?(herp[i].to_s) }
        end
        next_guess = @sets.first.to_s.split("").map {|x| x.to_i }
        @previous_guesses << next_guess
        next_guess
      elsif(wc + bc == 4)
        next_guess = @previous_guesses.last.shuffle
        #do not choose a number already in the list!!
        @previous_guesses << next_guess
        next_guess
      elsif(wc + bc == 3)
        #delete from sets if the number in sets is not included in the last guess
        herp = @previous_guesses.last.permutation(3).to_a
        herp.length.times do |i|
          @sets.keep_if {|x| x.to_s.include?(herp[i].to_s) }
        end
        next_guess = @sets.last.to_s.split("").map {|x| x.to_i }
        @previous_guesses << next_guess
        next_guess
      elsif(wc+bc == 2)
        herp = @previous_guesses.last.permutation(2).to_a
        herp.length.times do |i|
          @sets.keep_if {|x| x.to_s.include?(herp[i].to_s) }
        end
        next_guess = @sets.last.to_s.split("").map {|x| x.to_i }
        @previous_guesses << next_guess
        next_guess
        #do stuff
      elsif(wc+bc == 1)
        herp = @previous_guesses.last.permutation(1).to_a
        herp.length.times do |i|
        @sets.keep_if {|x| x.to_s.include?(herp[i].to_s) }
        end
        next_guess = @sets.last.to_s.split("").map {|x| x.to_i }
        @previous_guesses << next_guess
        next_guess
        #do more stuff
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
  # master = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)] 
  master = [3,6,5,5]
else
  puts "please set array"
  #mastermind = player
  #guesser = cpu
  guesser = Cpu.new
  master.map! {|x| x = gets.chomp.to_i }
  p master
end

class Engine
  def self.pegcounter(mstarr, guessarr)
    black = guessarr.each_with_index.map {|x, i| mstarr[i] == x ? "black" : x }
    cputemp = mstarr.each_with_index.map{|x, i| black[i] == "black" ? nil : x }
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



