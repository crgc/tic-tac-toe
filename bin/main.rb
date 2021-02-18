#!/usr/bin/env ruby
require './lib/player.rb'
require './lib/game.rb'
require './lib/poe.rb'

def show_game_title
  ascii_title = "___________.__               ___________                     ___________            \r\n\\__    ___/|__| ____         \\__    ___/____    ____         \\__    ___/___   ____  \r\n  |    |   |  |/ ___\\   ______ |    |  \\__  \\ _/ ___\\   ______ |    | /  _ \\_/ __ \\ \r\n  |    |   |  \\  \\___  /_____/ |    |   / __ \\\\  \\___  /_____/ |    |(  <_> )  ___/ \r\n  |____|   |__|\\___  >         |____|  (____  /\\___  >         |____| \\____/ \\___  >\r\n                   \\/                       \\/     \\/                            \\/ "
  puts ascii_title
end

def show_welcome_message
  puts "\n\nWelcome to Tic-Tac-Toe!\n"
end

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

def prompt_position
  loop do
    position = gets.chomp.to_i
    return position if (1..9).include?(position)

    puts 'Please choose a position from 1 to 9'
  end
end

def play(game)
  puts "\n#{game.current_player}, it's your turn. Make a move!\n"

  loop do
    position = prompt_position
    begin
      game.make_move(position)
    rescue PositionOccupiedError => poe
      puts "#{poe.message}. Try a different one this time:"
    else
      break
    end
  end
end

def start_game
  player1 = create_player('PLAYER 1')
  player2 = create_player('PLAYER 2', player1.opposite_marker)

  game = Game.new(player1, player2)
  game.start

  puts "\nGame is on!\n"
  while game.on
    puts("\n" << game.print_board << "\n")
    play(game)
  end

  puts "\nBye!\n"
end

show_game_title
show_welcome_message
start_game