class Player
  attr_reader :name, :hp

  def initialize(name)
    @name = name
    @hp = 80
  end

  def take_damage
    @hp -= 10
  end
end