#frozen_string_literal: true

def substrings(string, dic)
  counter = {}
    string.split(' ').each do |word|
      dic.each do |e|
        if word.downcase.include?(e)
          counter[e] == nil ? counter[e] = 1 : counter[e] +=1
        end
      end
    end
  counter
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
sentence = "Howdy partner, sit down! How's it going?"
p substrings(sentence, dictionary)