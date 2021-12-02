require 'game'

describe Game do
  let(:game) {described_class.new(player1,player2)}
  let(:player1) { double("Kim")}
  let(:player2) { double("Chris")}
  
  context '#add_players'
  it 'should accept player1 and retrieve it' do
    expect(game.players[0]).to eq(player1)
  end

  it 'should accept player2 and retrieve it' do
    expect(game.players[1]).to eq(player2)
  end

  context '#attack' 
  it "should inform the player to receive damage" do
    expect(player2).to receive(:receive_damage)
    game.attack(player2)
  end

  context '#current_turn' 
  it 'starts as player 1' do
    expect(game.current_turn).to eq player1
  end
  
  context '#switch_turn'
  it 'should switch turns between players' do
    game.switch_turn
    expect(game.current_turn).to eq(player2)
  end    

end