FactoryGirl.define do
  factory :game do
    name "MyString"
    players_count 4
    amount_per_card 0.50
    player1 "Jonos"
    player2 "Julio"
    player3 "Jonathan"
    player4 "Alex"

    factory :default_game do
    	name "Default Game"
      players_count 4
      amount_per_card 0.50
    end
  end

end
