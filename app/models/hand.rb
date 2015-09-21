class Hand < ActiveRecord::Base
	validates :game_id, presence: true

	belongs_to :game
	has_many :scores
end
