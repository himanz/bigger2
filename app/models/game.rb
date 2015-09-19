class Game < ActiveRecord::Base
  before_create :build_player
  after_create :build_roster

	validates :name, :players_count, :amount_per_card, :player1, :player2, :player3, :player4, :rule_id, presence: true

  has_many :rosters
	has_many :players, through: :rosters

	belongs_to :rule

  # Creates a player if no player under the same name is found in database
	def build_player
		players_array = [player1, player2, player3, player4]
		for i in 0..players_array.length-1
			unless Player.where(name: players_array[i]).first
				Player.create(name: players_array[i])
			end
		end
	end

  # Creates association between games and players through roster
	def build_roster
		players_array = [player1, player2, player3, player4]
		for i in 0..players_array.length-1
      Roster.create(game_id: id, player_id: Player.where(name: players_array[i]).first.id)     
 		end
	end
end
