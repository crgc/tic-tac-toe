#!/usr/bin/env ruby
require './lib/player.rb'
require './lib/game.rb'

# name1 = ''
# marker1 = ''
#
# puts 'Welcome Player 1, please introduce your name:'
# name1 = gets.chomp
#
# loop do
#   puts 'Please choose your marker: X or O'
#   marker1 = gets.chomp.upcase
#   break if %w[X O].include?(marker1)
# end
#
# puts 'Welcome Player 2, please introduce your name:'
# name2 = gets.chomp
#
# marker2 = (marker1 == 'X' ? 'O' : 'X')
# puts "You will play with #{marker2}"
#
# current_player = name1
# 1.upto(9) do
#   position = 0
#   puts "#{current_player} it's your turn. Choose a position"
#   loop do
#     position = gets.chomp.to_i
#     break if (1..9).include?(position)
#
#     puts 'Please choose a position from 1 to 9'
#   end
#   puts "#{current_player} chose position #{position}"
#   current_player = (current_player == name1 ? name2 : name1)
# end
#
# players = [name1, name2]
# puts "#{players[rand(0..1)]} won the game!"

def create_player(_alias_, marker = nil)
  player_name = prompt_player_name(_alias_)
  player_marker = marker.nil? ? prompt_player_marker : marker

  Player.new(player_name, player_marker.to_sym)
end

def prompt_player_name(player_alias)
  puts "\n#{player_alias}, what is your name?\n"
  gets.chomp
end

def prompt_player_marker
  loop do
    puts "Choose your marker: X or O\n"
    marker = gets.chomp.upcase

    return marker if %w[X O].include?(marker)
  end
end

ascii_title = "___________.__               ___________                     ___________            \r\n\\__    ___/|__| ____         \\__    ___/____    ____         \\__    ___/___   ____  \r\n  |    |   |  |/ ___\\   ______ |    |  \\__  \\ _/ ___\\   ______ |    | /  _ \\_/ __ \\ \r\n  |    |   |  \\  \\___  /_____/ |    |   / __ \\\\  \\___  /_____/ |    |(  <_> )  ___/ \r\n  |____|   |__|\\___  >         |____|  (____  /\\___  >         |____| \\____/ \\___  >\r\n                   \\/                       \\/     \\/                            \\/ "
puts ascii_title

welcome_message = "\n\nWelcome to Tic-Tac-Toe!\n"
puts welcome_message

player1 = create_player('PLAYER 1')
player2 = create_player('PLAYER 2', player1.opposite_marker)

print "\n"

player1.description
player2.description

game = Game.new(player1, player2)
game.start

while game.on
  puts "\nGame is on!\n"
  game.on = false
end

puts "\nBye!\n"