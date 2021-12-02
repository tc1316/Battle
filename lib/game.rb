class Game
  attr_reader :previous_action, :turn_counter, :current_turn, :target, :players
  
  def initialize(player1,player2)
    @players = [player1, player2]
    @turn_counter = 0
    @current_turn = player1 #Default
    @target = player2 #Default
  end

  def execute_action(action)
    @previous_action = action
  end

  def attack(player)
    player.receive_damage
    execute_action("Player attacked")
  end

  def switch_turn 
    @turn_counter += 1
    @current_turn = @players[@turn_counter % 2]
    @target = @players[(@turn_counter+1) % 2]
  end

end
