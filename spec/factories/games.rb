FactoryGirl.define do
  factory :game do
    name "MyString"
    players 4
    amount_per_card 0.50

    factory :default_game do
    	name "Default Game"
      players 4
      amount_per_card 0.50
    end
  end

end
