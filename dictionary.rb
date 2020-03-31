#frozen_string_literal: true

def substrings(string, dic)

counter = {}
string.split(' ').each do |word|
dic.each do |e|
  if word.downcase.include?(e)
    if counter[e] == nil
      counter[e] = 1
    else
      counter[e] +=1
    end
  end
end
end
counter
end

dictionary = ['hell', 'my', 'name',
   'is', 'hello', 'edd', 'ed', 'he']
sentence = "Hello my name is Edd Eddie"

=begin
returns 
{
  "hell"=>1, "hello"=>1, "he"=>1, 
  "my"=>1, "name"=>1, "is"=>1,
   "edd"=>2, "ed"=>2
}
=end

p substrings(sentence, dictionary)