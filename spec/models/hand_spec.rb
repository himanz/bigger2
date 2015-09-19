require 'rails_helper'

RSpec.describe Hand, type: :model do
  it "is valid with a card_left, points, game_id, player_id" do
  	hand = create(:hand)
  	expect(hand).to be_valid
  end

  it "is invalid without card_left" do
  	hand = build(:hand, card_left: nil)
    hand.valid?
    expect(hand.errors[:card_left].size).to eq(1)
  end

  it "is invalid without points" do
  	hand = build(:hand, points: nil)
  	hand.valid?
  	expect(hand.errors[:points].size).to eq(1)
  end

  it "is invalid without game_id" do
  	hand = build(:hand, game_id: nil)
  	hand.valid?
  	expect(hand.errors[:game_id].size).to eq(1)
  end

  it "is invalid without player_id" do
  	hand = build(:hand, player_id: nil)
  	hand.valid?
  	expect(hand.errors[:player_id].size).to eq(1)
  end
end
