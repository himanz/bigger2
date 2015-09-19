class Rule < ActiveRecord::Base
	validates_inclusion_of :winner_points, in: [true, false]
	validates :title,
	          :winner_points_amount, 
	          :line1_min,
	          :line1_max,
	          :line1_multiplier,
	          :line2_min,
	          :line2_max,
	          :line2_multiplier,
	          :line3_min,
	          :line3_max,
	          :line3_multiplier,
	          :line4_min,
	          :line4_max,
	          :line4_multiplier,
	          :line5_min,
	          :line5_max,
	          :line5_multiplier, presence: true

	has_many :games
end
