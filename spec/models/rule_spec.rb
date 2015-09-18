require 'rails_helper'

RSpec.describe Rule, type: :model do
  it "is valid with all attributes" do
  	rule = create(:rule)
  	expect(rule).to be_valid
  end

  it "is invalid without winner_points" do
  	rule = build(:rule, winner_points: nil)
    rule.valid?
    expect(rule.errors[:winner_points].size).to eq(1)
  end

  it "is invalid without winner_points_amount" do
  	rule = build(:rule, winner_points_amount: nil)
    rule.valid?
    expect(rule.errors[:winner_points_amount].size).to eq(1)
  end

  it "is invalid without line1_min" do
    rule = build(:rule, line1_min: nil)
    rule.valid?
    expect(rule.errors[:line1_min].size).to eq(1)
  end

  it "is invalid without line1_max" do
    rule = build(:rule, line1_max: nil)
    rule.valid?
    expect(rule.errors[:line1_max].size).to eq(1)
  end

  it "is invalid without line1_multipiler" do
    rule = build(:rule, line1_multiplier: nil)
    rule.valid?
    expect(rule.errors[:line1_multiplier].size).to eq(1)
  end

  it "is invalid without line2_min" do
    rule = build(:rule, line2_min: nil)
    rule.valid?
    expect(rule.errors[:line2_min].size).to eq(1)
  end

  it "is invalid without line2_max" do
    rule = build(:rule, line2_max: nil)
    rule.valid?
    expect(rule.errors[:line2_max].size).to eq(1)
  end

  it "is invalid without line2_multipiler" do
    rule = build(:rule, line2_multiplier: nil)
    rule.valid?
    expect(rule.errors[:line2_multiplier].size).to eq(1)
  end

  it "is invalid without line3_min" do
    rule = build(:rule, line3_min: nil)
    rule.valid?
    expect(rule.errors[:line3_min].size).to eq(1)
  end

  it "is invalid without line3_max" do
    rule = build(:rule, line3_max: nil)
    rule.valid?
    expect(rule.errors[:line3_max].size).to eq(1)
  end

  it "is invalid without line3_multipiler" do
    rule = build(:rule, line3_multiplier: nil)
    rule.valid?
    expect(rule.errors[:line3_multiplier].size).to eq(1)
  end

  it "is invalid without line4_min" do
    rule = build(:rule, line4_min: nil)
    rule.valid?
    expect(rule.errors[:line4_min].size).to eq(1)
  end

  it "is invalid without line4_max" do
    rule = build(:rule, line4_max: nil)
    rule.valid?
    expect(rule.errors[:line4_max].size).to eq(1)
  end

  it "is invalid without line4_multipiler" do
    rule = build(:rule, line4_multiplier: nil)
    rule.valid?
    expect(rule.errors[:line4_multiplier].size).to eq(1)
  end

  it "is invalid without line5_min" do
    rule = build(:rule, line5_min: nil)
    rule.valid?
    expect(rule.errors[:line5_min].size).to eq(1)
  end

  it "is invalid without line5_max" do
    rule = build(:rule, line5_max: nil)
    rule.valid?
    expect(rule.errors[:line5_max].size).to eq(1)
  end

  it "is invalid without line5_multipiler" do
    rule = build(:rule, line5_multiplier: nil)
    rule.valid?
    expect(rule.errors[:line5_multiplier].size).to eq(1)
  end

end
