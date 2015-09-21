require 'rails_helper'

RSpec.describe HandsController, type: :controller do
  describe "GET#index" do
  	context "with params" do
  		it "populates an array with all the hands" do
  			game = create(:game)
  			hand1 = create(:hand, game_id: game.id)
        hand2 = create(:hand, game_id: game.id)
        hand3 = create(:hand)
        get :index, game_id: game.id
        expect(assigns(:hands)).to match_array([hand1, hand2])
  		end

  		it "renders the :index view" do
        game = create(:game)
        hand1 = create(:hand, game_id: game.id)
        hand2 = create(:hand, game_id: game.id)
        get :index, game_id: game.id
        expect(response).to render_template :index
      end
  	end

  end
end
