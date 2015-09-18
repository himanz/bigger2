require 'rails_helper'

RSpec.describe PlayersController, type: :controller do
  describe "get #index" do
  	context "without params" do
  		it "populates an array with all the players" do
  			player = create(:player)
  			player2 = create(:default_player)
  			get :index
  			expect(assigns(:players)).to match_array([player, player2])
  		end
  	end
  end

  describe "get #show" do
  	it "assigns the correct player to @player" do
  		player = create(:player)
  		get :show, id: player
  		expect(assigns(:player)).to eq player
  	end

  	it "renders the :show view" do
  		player = create(:player)
  		get :show, id: player
  		expect(response).to render_template :show
  	end
  end
end
