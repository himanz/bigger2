class Hand < ActiveRecord::Base
	validates :card_left, :points, :game_id, :player_id, presence: true
end
