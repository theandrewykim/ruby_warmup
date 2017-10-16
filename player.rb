class Player
  attr_accessor :win_count, :turns, :piece
  attr_reader :number
  def initialize(player_number, turns = 0)
    @number = player_number
    @win_count = 0
    @turns = turns
    @pieces = []
  end
end
