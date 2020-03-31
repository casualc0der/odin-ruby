string = "Hello hello"


dic = ['hell', 'lo', 'hello', 'he', 'hel', 'llo']
gerp = {}
string.split(' ').each do |word|
dic.each do |e|
  if word.downcase.include?(e)
    if gerp[e] == nil
      gerp[e] = 1
    else
      gerp[e] +=1
    end
  end
end
end

p gerp


