class Hand < ActiveRecord::Base
	validates :game_id, presence: true
end
