class Sorter
  # with inspiration from https://www.geeksforgeeks.org/merge-sort/
  # divide
  def merge_sort(arr)
    return arr unless arr.size > 1
    mid = arr.size / 2
    l = arr.take(mid)
    r = arr.drop(mid)
    arr1 = merge_sort(l)
    arr2 = merge_sort(r)
    merge(arr1, arr2)
  end

  #conquer
  def merge(a, b)
    tmp_arr = []
    until a.empty? || b.empty?
      if a.first > b.first
        tmp_arr << b.first
        b.shift
      else
        tmp_arr << a.first
        a.shift
      end
    end
    
    until a.empty?
      tmp_arr << a.first
      a.shift
    end

    until b.empty?
      tmp_arr << b.first
      b.shift
    end

    return tmp_arr
  end
end

sort = Sorter.new

p sort.merge_sort([10, 2, 1, 7, 11, 27, 3]) #=> [1,2,3,7,10,11,27]
