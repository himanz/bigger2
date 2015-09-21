# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Rule.create(title: "Default",
	          winner_points: false,
	          winner_points_amount: 0,
	          line1_min: 1,
	          line1_max: 4,
	          line1_multiplier: 1,
	          line2_min: 5,
	          line2_max: 7,
	          line2_multiplier: 2,
	          line3_min: 8,
	          line3_max: 10,
	          line3_multiplier: 3,
	          line4_min: 11,
	          line4_max: 12,
	          line4_multiplier: 4,
	          line5_min: 13,
	          line5_max: 13,
	          line5_multiplier: 5,
)

Game.create(name: "game1", players_count: 4, amount_per_card: 0.5, player1: "Jonos", player2: "Julio", player3: "Jonathan", player4: "Alex", rule_id:1)
Game.create(name: "game2", players_count: 4, amount_per_card: 0.5, player1: "Jonos", player2: "Julio", player3: "Jonathan", player4: "D", rule_id: 1)

Hand.create(game_id: 1)

Score.create(cards_left: 4, points: 4, hand_id: 1, player_id: 1)
Score.create(cards_left: 3, points: 3, hand_id: 1, player_id: 2)
Score.create(cards_left: 1, points: 1, hand_id: 1, player_id: 3)
Score.create(cards_left: 0, points: 0, hand_id: 1, player_id: 4)

