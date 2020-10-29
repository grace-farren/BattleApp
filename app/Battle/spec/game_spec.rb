require 'game'

describe Game do
  let(:player1) {double :player1}
  let(:player2) {double :player2}
  let(:subject) { Game.new(player1, player2)}

  describe '#initialize' do
    it "recieves player objects and stores them" do
      expect(subject.player1).to eq player1
    end

    it "sets current_turn to player 1" do
      expect(subject.current_player).to eq player1
    end
  end
  
  describe '#attack' do
    it 'calls take damage on attack method' do

      expect(player2).to receive (:take_damage)
      subject.attack
    end
  end

  describe '#switch_turn' do
    it "set the current_turn to the other player" do
      subject.switch_turn
      expect(subject.current_player).to eq player2
    end
  end
end
