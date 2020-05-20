class Engine
  def self.pegcounter(mstarr, guessarr)
    black =
      guessarr.split('').each_with_index.map do |x, i|
        mstarr[i] == x ? 'black' : x
      end
    cputemp =
      mstarr.split('').each_with_index.map do |x, i|
        black[i] == 'black' ? nil : x
      end
    white =
      black.each_with_index.map do |x, i|
        if cputemp.include?(x)
          d = cputemp.index(x)
          cputemp[d] = nil
          'white'
        else
          nil
        end
      end
    black_count = black.count('black')
    white_count = white.count('white')
    return { black: black_count, white: white_count }
  end
end
