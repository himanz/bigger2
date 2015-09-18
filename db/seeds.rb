# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Game.create(name: "game1", players_count: 4, amount_per_card: 0.5, player1: "Jonos", player2: "Julio", player3: "Jonathan", player4: "Alex")
Game.create(name: "game2", players_count: 4, amount_per_card: 0.5, player1: "Jonos", player2: "Julio", player3: "Jonathan", player4: "D")
