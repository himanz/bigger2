class Roster < ActiveRecord::Base
	belongs_to :game
	belongs_to :player

	validates :game_id, :player_id, presence: true
end
