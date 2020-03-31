#frozen_string_literal: true

def stock_picker(arr)
  selling_margin = arr.min - arr.max
  best_days_to_buy_sell = []
  
    arr.combination(2).to_a.map do |x| 
      if x[1]-x[0] > selling_margin
        selling_margin = x[1]-x[0]
        best_days_to_buy_sell = [arr.index(x[0]), arr.index(x[1])]
      else
        next
      end
    end
  best_days_to_buy_sell
end

p stock_picker([1,2,3,4,5,6,7]) # returns 0,6
p stock_picker([7,6,5,4,3,2,1]) # returns 0,1 (best case scenario will be to lose 1!)
p stock_picker([10,1,7,9,11,17,9]) # returns 1,5
p stock_picker([1,2,3,6,9,1,0]) # returns 0,4 (removes lowest number on last day)
p stock_picker([10,1,2,3,4,5,6]) # returns 1, 6
