#frozen_string_literal: true

def caeser(word, shift=0)
  cipher = word.split('').map! do |letter|
    if letter.match(/[A-Z]/)
      (letter.ord - 64 + shift % 26 + 64).chr
    elsif letter.match(/[a-z]/)
      (letter.ord - 96 + shift % 26 + 96).chr
    else
      letter   
    end  
  end
cipher.join
end

p caeser("Edd is Cool!!",1)