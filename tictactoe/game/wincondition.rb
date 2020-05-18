require 'pry'

class Winconditon
  def self.winner(arr)
    player1 = arr.each_index.select {|x| arr[x] == 'X'}
    player2 = arr.each_index.select {|o| arr[o] == 'O'}
    return "p1" if self.winning_combos(player1)
    return "p2" if self.winning_combos(player2)
  end

  private

  def self.winning_combos(x)
    checker = x.sort {|a, b| a <=> b}

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
    winners.any? {|z| z == checker}

  end
end