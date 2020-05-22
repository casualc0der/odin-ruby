class Fibonacci

  def self.fibs(x, f = [])
    return f if x.times {|i| i < 2 ? f << 1 : f << f[i-2] + f[i-1] }
  end

  def self.fibs_fec(x, f = [])
   return x == 0 ? f : f = fibs_fec(x-1, f << (f[-1] || 1) + (f[-2] || 0))
  end
end

p Fibonacci.fibs(11) #=> [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]
p Fibonacci.fibs_fec(11) #=> [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]