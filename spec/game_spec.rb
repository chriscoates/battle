require 'game'

describe Game do

  subject(:game)    { described_class.new(player1, player2) }
  let(:player1)     { double :player1 }
  let(:player2)     { double :player2 }

  subject(:finished_game) { described_class.new(dead_player, player2) }
  let(:player2)    { double :player2, hit_points: 100 }
  let(:dead_player) { double :dead_player, hit_points: 0 }

  describe 'player 1' do
    it "gets player 1" do
      expect(game.players[0]).to eq player1
    end
  end

  describe 'player 2' do
    it "gets player 2" do
      expect(game.players[1]).to eq player2
    end
  end

  describe '#attack' do
    it "damages the other player" do
      expect(player2).to receive(:lose_hit_points)
      game.attack
    end
  end

  describe 'switching player turns' do
    it 'switches turns' do
      allow(player2).to receive(:lose_hit_points)
      game.attack
      game.switch
      expect(game.players[0]).to eq player2
    end
  end

  describe 'ending the game' do
    it 'returns true when game_over?' do
      expect(finished_game.game_over?).to eq true
    end
  end
end