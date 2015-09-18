class Game < ActiveRecord::Base
  # before_create :build_player

	validates :name, :players_count, :amount_per_card, :player1, :player2, :player3, :player4, presence: true

	has_and_belongs_to_many :players

	# def build_player
	# 	if Player.find(name: player1)
			
	# 	else
	# 		Player.create(name: player1)
	# 	end
	# end
end
