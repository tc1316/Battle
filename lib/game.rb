class Game
  attr_reader :previous_action, :player1, :player2, :turn_counter, :attacker, :target, :players
  
  def initialize(player1,player2)
    @player1 = player1 
    @player2 = player2
    @players = [@player1, @player2]
    @turn_counter = 0
    @attacker = @player1 #Default
    @target = @player2 #Default
  end

  def execute_action(action)
    @previous_action = action
  end

  def attack(player)
    player.receive_damage
    execute_action("Player attacked")
    turn_increment
  end

 

  def turn_increment
    @turn_counter += 1
    assign_turn
  end

  def assign_turn
    @attacker = @players[@turn_counter % 2]
    @target = @players[(@turn_counter+1) % 2]
  end
    
  
  

end
