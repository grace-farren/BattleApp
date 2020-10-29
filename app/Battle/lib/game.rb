class Game
  attr_reader :player1, :player2, :current_player

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def attack
    attacked_player = @current_player == player1 ? player2 : player1
    attacked_player.take_damage

    switch_turn
  end

  def switch_turn
    @current_player = current_player == player1 ? player2 : player1
  end

  def game_over?
    return @player1.hp == 0 || @player2.hp == 0
  end

end
