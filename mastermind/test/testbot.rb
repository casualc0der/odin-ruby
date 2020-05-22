require 'pry'
require_relative '../player'
require_relative '../cpu'
require_relative '../hardcpu'
require_relative '../engine'
require_relative '../dataextract'

class MastermindStress
  attr_reader :game_count,
              :master,
              :guesser,
              :mastermind,
              :games_completed,
              :winning_turn_totals
  attr_accessor :turn, :winning_turn, :white_count, :black_count
  def initialize
    @game_count = 0
    @turn = 1
    @white_count = 0
    @black_count = 0
    @master = Array.new(4)
    @guesser = HardCpu.new
    @mastermind = nil
    @master = (1111..6666).to_a
    @master.delete_if { |x| x.to_s.include?(0.to_s) }
    @master.delete_if { |x| x.to_s.include?(7.to_s) }
    @master.delete_if { |x| x.to_s.include?(8.to_s) }
    @master.delete_if { |x| x.to_s.include?(9.to_s) }
    @master.map!(&:to_s)
    @games_completed = 0
    @winning_turn = []
    @spreadsheet = Extractor.new
  end

  def reset_game
    @black_count = 0
    @white_count = 0
    @turn = 1
    @guesser = HardCpu.new
  end

  def winning_turn_totals
    winning_turn
  end

  def game_test(x)
    x.times do |i|
      raise ArgumentError if @master[i] == nil
      while black_count != 4
        guess_for_turn =
          guesser.guessprotocol(@white_count, @black_count, @turn)
        mastermind = Engine.pegcounter(@master[i], guess_for_turn)
        @white_count = mastermind[:white]
        @black_count = mastermind[:black]
        @turn += 1
      end
      @games_completed += 1
      @winning_turn << @turn
      reset_game
      next
    end
    @spreadsheet.extract_info(@master, @winning_turn)
    @games_completed
  end
end
