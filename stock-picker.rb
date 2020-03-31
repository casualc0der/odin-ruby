#frozen_string_literal: true

def stock_picker(arr)

  min = arr.index(arr.min)
  max = arr.index(arr.max)

  while min > max
    if arr.length == 2
      break
    else
    arr.delete(arr.min)
    min = arr.index(arr.min)
    end
  end
  [min, max]
end

p stock_picker([1,2,3,4,5,6,7]) # returns 0,6
p stock_picker([7,6,5,4,3,2,1]) # returns 1,0 (best case scenario will be to lose 1!)
p stock_picker([10,1,7,9,11,17,9]) # returns 1,5
p stock_picker([1,2,3,6,9,1,0]) # returns 0,4 (removes lowest number on last day)
