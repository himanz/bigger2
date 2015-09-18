class Game < ActiveRecord::Base
	validates :name, :players_count, :amount_per_card, :player1, :player2, :player3, :player4, presence: true

	has_and_belongs_to_many :players
end
