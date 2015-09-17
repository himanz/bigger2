class Game < ActiveRecord::Base
	validates :name, :players_count, :amount_per_card, presence: true
end
