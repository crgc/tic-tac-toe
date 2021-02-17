#!/usr/bin/env ruby
require './lib/player.rb'
require './lib/game.rb'

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

def show_game_title
  ascii_title = "___________.__               ___________                     ___________            \r\n\\__    ___/|__| ____         \\__    ___/____    ____         \\__    ___/___   ____  \r\n  |    |   |  |/ ___\\   ______ |    |  \\__  \\ _/ ___\\   ______ |    | /  _ \\_/ __ \\ \r\n  |    |   |  \\  \\___  /_____/ |    |   / __ \\\\  \\___  /_____/ |    |(  <_> )  ___/ \r\n  |____|   |__|\\___  >         |____|  (____  /\\___  >         |____| \\____/ \\___  >\r\n                   \\/                       \\/     \\/                            \\/ "
  puts ascii_title
end

def show_welcome_message
  puts "\n\nWelcome to Tic-Tac-Toe!\n"
end

def start_game
  player1 = create_player('PLAYER 1')
  player2 = create_player('PLAYER 2', player1.opposite_marker)

  game = Game.new(player1, player2)
  game.start

  while game.on
    puts "\nGame is on!\n"
    game.on = false
  end

  puts "\nBye!\n"
end

show_game_title
show_welcome_message
start_game