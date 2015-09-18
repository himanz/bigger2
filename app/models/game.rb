class Game < ActiveRecord::Base
  before_create :build_player

	validates :name, :players_count, :amount_per_card, :player1, :player2, :player3, :player4, presence: true

	has_and_belongs_to_many :players

	def build_player
		players_array = [player1, player2, player3, player4]
		for i in 0..players_array.length
			unless Player.where(name: players_array[i]).first
				Player.create(name: players_array[i])
			end
		end
	end
end
