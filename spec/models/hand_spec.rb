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

  it "associates a hand with scores" do
  	rule = create(:rule)
    game = create(:game, rule_id: rule.id)
		hand = create(:hand, game_id: game.id)
  	score1 = create(:score, hand_id: hand.id, player_id: 1)
  	score2 = create(:score, hand_id: hand.id, player_id: 2)
  	score3 = create(:score, hand_id: hand.id, player_id: 3)
  	score4 = create(:score, hand_id: hand.id, player_id: 4)
    expect(hand.scores.count).to eq(4)
  end

  it "deletes associated scores when hand is deleted" do
    rule = create(:rule)
    game = create(:game, rule_id: rule.id)
    hand = create(:hand, game_id: game.id)
    hand2 = create(:hand, game_id: game.id)
    score1 = create(:score, hand_id: hand.id, player_id: 1)
    score2 = create(:score, hand_id: hand.id, player_id: 2)
    score3 = create(:score, hand_id: hand.id, player_id: 3)
    score4 = create(:score, hand_id: hand.id, player_id: 4)
    score5 = create(:score, hand_id: hand2.id, player_id: 1)
    expect(hand.scores.count).to eq(4)
    hand.destroy
    expect(hand.scores.count).to eq(0)
    expect(Hand.all.count).to eq(1)
  end
end
