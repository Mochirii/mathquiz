class Player

  def initialize(name)
    @name = name
    @point = 3
  end

  def lose_a_point
    @point -= 1
  end
  
  attr_reader :point, :name

  def self.score players
    "#{players[0].player_score} vs #{players[1].player_score}"
  end
  
end