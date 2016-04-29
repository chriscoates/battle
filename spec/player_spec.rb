require 'player'

describe Player do
  subject(:amy)   { Player.new('Amy')}
  subject(:chris) { Player.new('Chris')}

  describe '#name' do
    it "returns its name" do
      expect(amy.name).to eq 'Amy'
    end
  end

  describe '#hit_points' do
    it "returns the hit points" do
      expect(amy.hit_points).to eq described_class::STARTING_HP
    end
  end

  describe '#lose_hit_points' do
    it "reduces the other players's hit points" do
      allow(Kernel).to receive(:rand) {10}
      expect {amy.lose_hit_points}.to change { amy.hit_points }.by(-10)
    end
  end

end