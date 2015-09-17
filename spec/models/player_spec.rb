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
end
