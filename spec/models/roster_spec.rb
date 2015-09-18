require 'rails_helper'

RSpec.describe Roster, type: :model do
  it "is valid with a game_id and player_id" do
  	roster = create(:roster)
  	expect(roster).to be_valid
  end

  it "is invalid without a game_id" do
  	roster = build(:roster, game_id: nil)
  	roster.valid?
  	expect(roster.errors[:game_id].size).to eq(1)
  end

  it "is invalid without a player_id" do
  	roster = build(:roster, player_id: nil)
  	roster.valid?
  	expect(roster.errors[:player_id].size).to eq(1)
  end
end
