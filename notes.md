Connect four simulator:

Board is 10x10 board,
[[true, false, false, false, false, false, false, false, false, false],[true, false, false, false, false, false, false, false, false, false],[true, false, false, false, false, false, false, false, false, false],[true, false, false, false, false, false, false, false, false, false],[true, false, false, false, false, false, false, false, false, false],[true, false, false, false, false, false, false, false, false, false],[true, false, false, false, false, false, false, false, false, false],[true, false, false, false, false, false, false, false, false, false],[true, false, false, false, false, false, false, false, false, false],[true, false, false, false, false, false, false, false, false, false, false]]

when a piece gets dropped, it gets pushed through the arrays until the column array index has a T in it.

Display board to view =
board_row = []
array.each do |array|
  print board_row.join(" ") if !board_row.empty?
  board_row = []
  puts " "
  array.each do |element|
    if element == true
      board_row << "o"
    else
      board_row << "x"
    end
  end
end


player enters input from 1-10.
which gets set as the column value
placing the piece will iterate through array like [n][i] [n+i][n] - if n+1 has a piece set the the piece there
play board again
keep track of the number of turns in the game. If there have been 7 pieces played check the array to see if any four pieces are next to each other.
If we're saving coordinates of all the pieces - we can push pieces to the board array, and check coordinates of all x- and all o pieces. if [n][i] has either [i], [i+1] or [i-1] we should continue the check
Only need to check for a new piece that's been played
look for another in a row and chain off of that
