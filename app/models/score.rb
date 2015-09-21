class Score < ActiveRecord::Base
	validates :cards_left, :points, :hand_id, :player_id, presence: true
	belongs_to :hand
end
