require 'game'

describe Game do
  let(:player) {double :player}
  describe '#attack' do

    it 'calls take damage on attack method' do

      expect(player).to receive (:take_damage)
      subject.attack(player)
    end
  end
end
