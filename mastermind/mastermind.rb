require 'pry'
require_relative 'player'
require_relative 'cpu'
require_relative 'engine'

turn = 1
white_count = 0
black_count = 0
master = Array.new(4)
guesser = nil
mastermind = nil

puts 'Hello, do you wanna be guesser(g) or mastermind(m)?'
choice = gets.chomp
if choice == 'g'
  guesser = Human.new
  master = [rand(1..6), rand(1..6), rand(1..6), rand(1..6)].join
else
  puts 'please set array'
  guesser = Cpu.new
  master = gets.chomp
end

while black_count != 4
  puts "Turn #{turn}"
  guess_for_turn = guesser.guessprotocol(white_count, black_count, turn)
  puts guess_for_turn
  mastermind = Engine.pegcounter(master, guess_for_turn)
  white_count = mastermind[:white]
  black_count = mastermind[:black]
  p "black = #{mastermind[:black]}"
  p "white = #{mastermind[:white]}"
  turn += 1
end
