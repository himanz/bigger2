require 'rails_helper'

RSpec.describe Game, type: :model do
  it "is valid with a name, players_count, player1, player2, player3, player4 and amount per card" do
  	game = create(:default_game)
  	expect(game).to be_valid
  end

  it "is invalid without a name" do
  	game = build(:default_game, name: nil)
    game.valid?
    expect(game.errors[:name].size).to eq(1)
  end

  it "is invalid without players_count" do
  	game = build(:default_game, players_count: nil)
    game.valid?
    expect(game.errors[:players_count].size).to eq(1)
  end

  it "is invalid without an amount per card" do
  	game = build(:default_game, amount_per_card: nil)
    game.valid?
    expect(game.errors[:amount_per_card].size).to eq(1)
  end

  it "is invalid without player1" do
  	game = build(:default_game, player1: nil)
    game.valid?
    expect(game.errors[:player1].size).to eq(1)
  end

  it "is invalid without player2" do
  	game = build(:default_game, player2: nil)
    game.valid?
    expect(game.errors[:player2].size).to eq(1)
  end

  it "is invalid without player3" do
  	game = build(:default_game, player3: nil)
    game.valid?
    expect(game.errors[:player3].size).to eq(1)
  end

  it "is invalid without player4" do
  	game = build(:default_game, player4: nil)
    game.valid?
    expect(game.errors[:player4].size).to eq(1)
  end

  it "is invalid without a rule_id" do
  	game = build(:default_game, rule_id: nil)
  	game.valid?
  	expect(game.errors[:rule_id].size).to eq(1)
  end

  it "associates players with game" do
  	game = create(:game)
  	expect(Game.where(id: game).first.players.count).to eq(4)
  end

  it "associates game with a rule" do
  	rule = create(:rule)
  	game = create(:game, rule_id: rule.id)
  	expect(game.rule).to eq(rule)
  end

  it "associates game with hands" do
  	game = create(:game)
  	hand1 = create(:hand, game_id: game.id)
  	hand2 = create(:hand, game_id: game.id)
  	expect(game.hands.count).to eq(2)
  end
end
