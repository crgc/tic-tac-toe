#!/usr/bin/env ruby
require "./lib/player.rb"
require "./lib/game.rb"
require "./lib/poe.rb"
require "./lib/game_state.rb"

def show_game_title
  ascii_title = "___________.__               ___________                     ___________            \r\n\\__    ___/|__| ____         \\__    ___/____    ____         \\__    ___/___   ____  \r\n  |    |   |  |/ ___\\   ______ |    |  \\__  \\ _/ ___\\   ______ |    | /  _ \\_/ __ \\ \r\n  |    |   |  \\  \\___  /_____/ |    |   / __ \\\\  \\___  /_____/ |    |(  <_> )  ___/ \r\n  |____|   |__|\\___  >         |____|  (____  /\\___  >         |____| \\____/ \\___  >\r\n                   \\/                       \\/     \\/                            \\/ "
  puts ascii_title
end

def show_welcome_message
  print_line("\nWelcome to Tic-Tac-Toe!")
end

def create_player(_alias_, marker = nil)
  player_name = prompt_player_name(_alias_)
  player_marker = marker.nil? ? prompt_player_marker : marker

  Player.new(player_name, player_marker.to_sym)
end

def prompt_player_name(player_alias)
  print_line("#{player_alias}, what is your name?")
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
  print_line("#{game.current_player}, it's your turn. Make a move!")

  loop do
    position = prompt_position
    begin
      game.make_move(position)
    rescue PositionOccupiedError => poe
      puts "Oops! #{poe.position} is taken! Try a different one this time:"
    else
      print_board(game)
      break
    end
  end
end

def print_line(text)
  puts "\n" << text << "\n"
end

def print_board(game)
  puts game.print_board
end

def print_end_of_game(game)
  case game.game_state
  when GameState::WIN
    print_line("#{game.current_player} is the winner!")
  when GameState::DRAW
    print_line("It's a draw!")
  else
    print_line('Error: This stage should not be reached.')
  end

  print_line('Thanks for playing. Goodbye!')
end

def start_game
  player1 = create_player('PLAYER 1')
  player2 = create_player('PLAYER 2', player1.opposite_marker)

  game = Game.new(player1, player2)
  game.start

  print_line('Game is on!')
  print_board(game)

  while game.is_ongoing
    play(game)
  end

  print_end_of_game(game)
end

show_game_title
show_welcome_message
start_game