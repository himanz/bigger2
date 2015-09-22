require 'rails_helper'

RSpec.describe Hand, type: :model do
  it "is valid with a game_id" do
  	hand = create(:hand)
  	expect(hand).to be_valid
  end

  it "is invalid without game_id" do
  	hand = build(:hand, game_id: nil)
  	hand.valid?
  	expect(hand.errors[:game_id].size).to eq(1)
  end

  it "associates hand with a game" do
  	game = create(:game)
  	hand = create(:hand, game_id: game.id)
  	expect(hand.game.id).to eq(game.id)
  end
end
