class Game < ActiveRecord::Base
	validates :name, :players_count, :amount_per_card, presence: true

	has_and_belongs_to_many :players
end
