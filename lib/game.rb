class Game

  attr_reader :players

  def initialize(player1, player2)
    @players = [player1,player2]
  end

  def attack
    players[1].lose_hit_points
  end

  def switch
    @players[0], @players[1] = @players[1], @players[0]
  end

  def game_over?
    dead_player?
  end

  private

  def dead_player?
    players[1].hit_points == 0 || players[0].hit_points == 0
  end

end