FactoryGirl.define do
  factory :game do
    name "MyString"
    players_count 4
    amount_per_card 0.50

    factory :default_game do
    	name "Default Game"
      players_count 4
      amount_per_card 0.50
    end
  end

end
