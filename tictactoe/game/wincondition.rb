require 'pry'

class Winconditon
  def self.winner?(arr=[])
    player1 = arr.each_index.select {|x| arr[x] == 'X'}
    player2 = arr.each_index.select {|o| arr[o] == 'O'}
    return true if self.winning_combos(player1)
    return true if self.winning_combos(player2)
    false
  end
  private

  def self.winning_combos(x)
    checker = x.sort.combination(3).to_a
    winners = [
              [0,1,2],
              [3,4,5],
              [6,7,8],
              [0,3,6],
              [1,4,7],
              [2,5,8],
              [2,4,6],
              [0,4,8]
                     ]
    winners.any? {|z| checker.any? {|s| s == z }}
  end
end