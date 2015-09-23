class Player < ActiveRecord::Base
	validates :name, presence: true
	validates :name, uniqueness: true

  has_many :rosters
	has_many :games, through: :rosters
end
