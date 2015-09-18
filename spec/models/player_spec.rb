require 'rails_helper'

RSpec.describe Player, type: :model do
  it "is valid with a name" do
  	player = create(:player)
  	expect(player).to be_valid
  end

  it "is invalid without a name" do
  	player = build(:default_player, name: nil)
    player.valid?
    expect(player.errors[:name].size).to eq(1)
  end

  it "creates players objects when a game is created" do
  	game = create(:game)
  	expect(Player.where(name: game.player1)).to be_present
  	expect(Player.where(name: game.player2)).to be_present
  	expect(Player.where(name: game.player3)).to be_present
  	expect(Player.where(name: game.player4)).to be_present
  end

  it "does not create duplicate player objects" do
  	game = create(:game)
  	game2 = create(:game, name: "game2")
  	expect(Player.where(name: game.player1).count).to eq(1)
  end
end
