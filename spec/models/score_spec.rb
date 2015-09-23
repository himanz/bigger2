require 'rails_helper'

RSpec.describe Score, type: :model do
  it "is valid with cards_left, points, hand_id, player_id" do
  	rule = create(:rule)
    game = create(:game, rule_id: rule.id)
		hand = create(:hand, game_id: game.id)
		score = create(:score, hand_id: hand.id)
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
  	rule = create(:rule)
    game = create(:game, rule_id: rule.id)
		hand = create(:hand, game_id: game.id)
		score = create(:score, hand_id: hand.id)
  	expect(score.hand_id).to eq hand.id
  end

  it "multiplier function performs as intended" do
  	rule = create(:rule)
  	game = create(:game, rule_id: rule.id)
  	hand = create(:hand, game_id: game.id)
  	score = create(:score, hand_id: hand.id, cards_left: 13)
  	expect(score.multiplier).to eq(65)
  	score.cards_left = 11
  	expect(score.multiplier).to eq(44)
  	score.cards_left = 9
  	expect(score.multiplier).to eq(27)
  	score.cards_left = 6
  	expect(score.multiplier).to eq(12)
  	score.cards_left = 2
  	expect(score.multiplier).to eq(2)
  	score.cards_left = 0
  	expect(score.multiplier).to eq(0)
  end

  # it "points are multiplied properly" do
  # 	rule = create(:rule)
  # 	game = create(:game, rule_id: rule.id)
  # 	hand = create(:hand, game_id: game.id)
  # 	score = create(:score, hand_id: hand.id, cards_left: 13)
  # 	expect(score.points).to eq(65)
  # 	score.cards_left = 11
  # 	expect(score.points).to eq(44)
  # 	score.cards_left = 9
  # 	expect(score.points).to eq(27)
  # 	score.cards_left = 6
  # 	expect(score.points).to eq(12)
  # 	score.cards_left = 2
  # 	expect(score.points).to eq(2)
  # 	score.cards_left = 0
  # 	expect(score.points).to eq(0)
  # end
end
