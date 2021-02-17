#!/usr/bin/env ruby

players_picks = %w[1 2 3 4 5 6 7 8 9]

def print_board(ary)
  hor_border = '______'
  ver_border = '|'
  puts ''
  1.upto(ary.size + 1) do |i|

      print ver_border
      print ary[i - 1].to_s.gsub('[', '').gsub(']', '').gsub('"', '')

    if i % 3 == 0
      print ver_border; puts ''
    end

  end
  puts ''
end

def tied_game(players_picks)
  if ((players_picks.count(%w[X]) + players_picks.count(%w[O])) > 7)
    return true
  else
    return false
  end
end

def winner_move (players_picks)
  if ((players_picks.count(%w[X]) + players_picks.count(%w[O])) > 5) && (rand(0..10) %2 == 0)
    return true
  else
    return false
  end
end

name1 = ''
marker1 = ''

puts 'Welcome Player 1, please introduce your name:'
name1 = gets.chomp

loop do
  puts 'Please choose your marker: X or O'
  marker1 = gets.chomp.upcase
  break if %w[X O].include?(marker1)
end

puts 'Welcome Player 2, please introduce your name:'
name2 = gets.chomp

marker2 = (marker1 == 'X' ? 'O' : 'X')
puts "You will play with #{marker2}"

current_player = name1
no_winner = true

# initial instructions for player

print_board(players_picks)

while no_winner
  position = 0
  puts "#{current_player} it\'s your turn. Choose a position"

  loop do
    position = gets.chomp.to_i
    break if (1..9).include?(position) && players_picks.include?(position.to_s)

    puts 'Please choose a position from 1 to 9'
    puts 'Make sure you choose a free position'
  end
  players_picks[position - 1] = %w[X O].values_at(rand(0..1))
  puts "#{current_player} chose position #{position}"
  break if winner_move(players_picks) || tied_game(players_picks)
  print_board(players_picks)
  current_player = (current_player == name1 ? name2 : name1)
end

players = [name1, name2]
puts "#{players[rand(0..1)]} won the game!"
