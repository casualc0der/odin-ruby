class Cpu
  attr_reader :previous_guesses
  attr_accessor :sets
  def initialize
    @sets = (1111..6666).to_a
    @sets.delete_if { |x| x.to_s.include?(0.to_s) }
    @sets.delete_if { |x| x.to_s.include?(7.to_s) }
    @sets.delete_if { |x| x.to_s.include?(8.to_s) }
    @sets.delete_if { |x| x.to_s.include?(9.to_s) }
    @sets.map!(&:to_s)
    @previous_guesses = []
    @final_combo = []
  end

  def deleter
    last_guess = @previous_guesses.last
    4.times { |i| @sets.delete_if { |x| x.include?(last_guess[i]) } }
  end

  def simple_selector
    new_set = []
    last_guess = @previous_guesses.last.split('')

    last_guess.length.times do |i|
      new_set << @sets.select { |x| x.include?(last_guess[i]) }
    end

    @sets = new_set.flatten.uniq
  end

  def strict_selector(pegs)
    new_set = []
    last_guess = @previous_guesses.last.split('')
    z = last_guess.permutation(pegs).to_a
    z.map! { |x| x.join + ('.' * (4 - pegs)) }
    possible_combos = z.map { |x| x.split('').permutation(4).to_a.uniq }
    possible_combos.length.times do |i|
      possible_combos[i].length.times do |j|
        rx = Regexp.new(possible_combos[i][j].join, true)
        new_set << @sets.select { |x| rx.match(x) }
      end
    end
    @sets = new_set.flatten.uniq
  end

  def guessprotocol(wc, bc, turn)
    if (@sets.length <= 2)
      next_guess = @sets.last.to_s.split('').map(&:to_i)
      next_guess
    end

    if turn == 1
      @previous_guesses << '1122'
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
        next_guess = @sets[@sets.length / 2]
        @sets.delete(@previous_guesses.last)
        @previous_guesses << next_guess
        @previous_guesses.last
      end
    end
  end
end
