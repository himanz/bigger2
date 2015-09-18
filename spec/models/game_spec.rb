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

  # it "creates players objects" do
  # 	game = create(:game)
  # 	expect(Player.find(name: game.player1)).to be_valid
  # end
end
