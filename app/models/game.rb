class Game < ActiveRecord::Base
	validates :name, :players, :amount_per_card, presence: true
end
