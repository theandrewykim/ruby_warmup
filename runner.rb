require_relative 'piece'
require_relative 'player'
require_relative 'board'

player_1 = Player.new(1)
player_2 = Player.new(2)
players = [player_1, player_2]

def run_game(players)
  board = Board.new([players])
  board.display_board
  column = gets.chomp.to_i - 1
  latest_piece = Piece.new(players.first, board, column)
  latest_piece.place
  board.display_board
  until board.over == true
    column = gets.chomp.to_i - 1
    if board.pieces.last.player == players.first
      current_player = players.last
    else
      current_player = players.first
    end
    latest_piece = Piece.new(current_player, board, column)
    latest_piece.place
    board.display_board
    board.player_won? if board.pieces.length >= 7
  end
  current_player.win_count += 1
  print "player " + current_player.number.to_s + " has" + current_player.win_count.to_s + " wins."
  puts " play again? y/n"
  run_game(players) if gets.chomp == "y"
end



run_game(players)
puts "Thanks for playing!"
