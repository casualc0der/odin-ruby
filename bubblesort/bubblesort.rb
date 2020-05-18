class Bubble
  def self.sort(arr)
    raise ArgumentError.new("Arrays only please!") unless arr.is_a?(Array)
    n = arr.length
    until n <= 1
      swaps = 0
      for i in (1..n-1)
        if arr[i-1] > arr[i]
          arr[i-1], arr[i] = arr[i], arr[i-1]
          swaps = i
        end
      end
      n = swaps
    end
    arr
  end
end