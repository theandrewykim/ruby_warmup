class Piece
  attr_reader :column, :coordinates, :shape, :player
  def initialize(player, board, column)
    @row = nil
    @column = column
    @player = player
    @board = board
    @coordinates = nil
  end

  def shape
    if @player.number == 1
      return "x"
    else
      return "o"
    end
  end

  def place
    row_index = 0
    board_array = @board.array
    done = false
    if @board.array[@column].all? {|space| space == "-"}
      @board.array[@column][9] = shape
      @coordinates = [@column, 9]
   else
     @board.array[@column].each do |space|
       if @board.array[@column][row_index + 1] != "-" && done == false
         @board.array[@column][row_index] = shape
         @coordinates = [@column, row_index]
         done = true
       elsif done == false
         row_index += 1
       end
     end
   end
   @player.turns += 1
   @board.pieces << self
  end

end
