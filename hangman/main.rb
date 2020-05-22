require_relative './lib/hangman'

banner = File.read("./assets/banner.txt")
puts banner
game = Hangman.new(Time.now)
game.start