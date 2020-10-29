require 'player'

describe Player do
  let(:subject) { Player.new("Bob") }

  it "has a method that returns name" do
    expect(subject.name).to eq "Bob"
  end
end