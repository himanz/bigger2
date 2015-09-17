require 'rails_helper'

RSpec.describe Game, type: :model do
  it "is valid with a name, players and amount per card" do
  	game = create(:default_game)
  	expect(game).to be_valid
  end

  it "is invalid without a name" do
  	game = build(:default_game, name: nil)
    game.valid?
    expect(game.errors[:name].size).to eq(1)
  end

  it "is invalid without players" do
  	game = build(:default_game, players: nil)
    game.valid?
    expect(game.errors[:players].size).to eq(1)
  end

  it "is invalid without an amount per card" do
  	game = build(:default_game, amount_per_card: nil)
    game.valid?
    expect(game.errors[:amount_per_card].size).to eq(1)
  end
end
