FactoryGirl.define do
  factory :rule do
  	title "Default"
    winner_points false
		winner_points_amount 0
		line1_min 1
		line1_max 4
		line1_multiplier 1
		line2_min 5
		line2_max 7
		line2_multiplier 2
		line3_min 8
		line3_max 10
		line3_multiplier 3
		line4_min 11
		line4_max 12
		line4_multiplier 4
		line5_min 13
		line5_max 13
		line5_multiplier 5
  end
end
