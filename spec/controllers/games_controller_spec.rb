require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe 'GET#index' do
  	context 'without params' do
  		it "populates an array with all the games" do
  			game1 = create(:game)
  			game2 = create(:default_game)
  			get :index
  			expect(assigns(:games)).to match_array([game1, game2])
  		end

  		it "renders the :index view" do
  			get :index
  			expect(response).to render_template :index
  		end
  	end
  end

  describe 'GET#show' do
  	it "assigns the correct game to @game" do
  		game = create(:game)
  		get :show, id: game
  		expect(assigns(:game)).to eq game
  	end

  	it "renders the :show view" do
  		game = create(:game)
  		get :show, id: game
  		expect(response).to render_template :show
  	end
  end
end
