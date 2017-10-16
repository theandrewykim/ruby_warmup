class Board
  attr_accessor :array, :pieces
  attr_reader :over
  def initialize(players=[])
    @array = [["[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]"],["[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]"],["[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]"],["[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]"],["[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]"],["[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]"],["[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]"],["[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]"],["[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]"],["[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]", "[]"]]
    @player_1 = players[0]
    @player_2 = players[1]
    @pieces = []
    @over = false
  end

  def display_board
    y = 0
    10.times do
      x = 0
      10.times do
        print @array[x][y] + " "
        x += 1
      end
      puts ""
      y += 1
    end
    print "= = = = = = ="
  end

  def player_won?
    piece = @pieces.last
    player = piece.player
    check_horizontal(piece)
    check_vertical(piece)
    check_diagonals(piece)
    puts "player number " + player.number.to_s + " won!" if @over == true
  end

  def check_diagonals(piece)
    if piece.coordinates.last > 6
      top_y = 9
      bottom_y = piece.coordinates.last - 3
    elsif piece.coordinates.last < 3
      bottom_y = 0
      top_y = piece.coordinates.last  + 3
    else
      top_y = piece.coordinates.last  + 3
      bottom_y = piece.coordinates.last - 3
    end
    if piece.coordinates.first > 6
      top_x = 9
      bottom_x = piece.coordinates.first - 3
    elsif piece.coordinates.first < 3
      bottom_x = 0
      top_x = piece.coordinates.first + 3
    else
      top_x = piece.coordinates.first + 3
      bottom_x = piece.coordinates.first - 3
    end
    range = [[bottom_x, bottom_y],[top_x, top_y]]
    top_right(range, piece)
    bottom_right(range, piece)
    top_left(range, piece)
    bottom_left(range, piece)
  end

  def top_right(range, piece)
    start_coordinates = range[0]
    finish_coordinates = range.last
    finish_x = finish_coordinates.first
    finish_y = finish_coordinates.last
    x = start_coordinates.first
    y = start_coordinates.last
    counter = 0
    while x <= finish_x && y <= finish_y
      if @array[x][y] == piece.shape
        counter += 1
        @over = true if counter == 4
      else
        counter = 0
      end
      x += 1
      y += 1
    end
  end

  def bottom_right(range, piece)
    start_coordinates = range.last
    finish_coordinates = range.first
    finish_x = finish_coordinates.first
    finish_y = finish_coordinates.last
    x = start_coordinates.first
    y = start_coordinates.last
    counter = 0
    while x >= finish_x && y >= finish_y
      if @array[x][y] == piece.shape
        counter += 1
        @over = true if counter == 4
      else
        counter = 0
      end
      x -= 1
      y -= 1
    end
  end

  def top_left(range, piece)
    finish_x = range.first.first
    finish_y = range.last.last
    x =  range.last.first
    y = range.first.last
    counter = 0
    while x >= finish_x && y <= finish_y
      if @array[x][y] == piece.shape
        counter += 1
        @over = true if counter == 4
      else
        counter = 0
      end
      x -= 1
      y += 1
    end
  end

  def bottom_left(range, piece)
    finish_x = range.last.first
    finish_y = range.first.last
    x =  range.first.first
    y = range.last.last
    counter = 0
    while x <= finish_x && y >= finish_y
      if @array[x][y] == piece.shape
        counter += 1
        @over = true if counter == 4
      else
        counter = 0
      end
      x += 1
      y -= 1
    end
  end

  def check_horizontal(piece)
    piece_coordinates = piece.coordinates
    shape = piece.shape
    x = piece.coordinates.first - 3
    y = piece.coordinates.last
    if piece.coordinates.first < 6
      finish_x = piece.coordinates.first + 3
    else
      finish_x = 9
    end
    counter = 0
    while x <= finish_x
      if @array[x][y] == shape
        counter += 1
        @over = true if counter == 4
      else
        counter = 0
      end
      x += 1
    end
  end

  def check_vertical(piece)
    piece_coordinates = piece.coordinates
    shape = piece.shape
    y = piece.coordinates.last - 3
    x = piece.coordinates.first
    if piece.coordinates.last < 6
      finish_y = piece.coordinates.last + 3
    else
      finish_y = 9
    end
    counter = 0
    while y <= finish_y
      if @array[x][y] == shape
        counter += 1
        @over = true if counter == 4
      else
        counter = 0
      end
      y += 1
    end
  end


end
