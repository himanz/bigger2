require 'rails_helper'

RSpec.describe Score, type: :model do
  it "is valid with cards_left, points, hand_id, player_id" do
  	score = create(:score)
  	expect(score).to be_valid
  end

  it "is invalid without cards_left" do
  	score = build(:score, cards_left: nil)
    score.valid?
    expect(score.errors[:cards_left].size).to eq(1)
  end

  it "is invalid without points" do
  	score = build(:score, points: nil)
    score.valid?
    expect(score.errors[:points].size).to eq(1)
  end

  it "is invalid without hand_id" do
  	score = build(:score, hand_id: nil)
    score.valid?
    expect(score.errors[:hand_id].size).to eq(1)
  end

  it "is invalid without player_id" do
  	score = build(:score, player_id: nil)
    score.valid?
    expect(score.errors[:player_id].size).to eq(1)
  end

  it "associates a score with a hand" do
  	hand = create(:hand)
  	score = create(:score, hand_id: hand.id)
  	expect(score.hand_id).to eq hand.id
  end
end
