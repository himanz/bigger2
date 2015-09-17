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

  describe 'GET #new' do
  	it "assigns a new game to @game" do
  		get :new
  		expect(assigns(:game)).to be_a_new(Game)
  	end
  end

  describe 'POST #create' do
  	context "with valid attributes" do
  		it "saves the new game in the database" do
  			expect{
  				post :create, game: attributes_for(:game)
  			}.to change(Game, :count).by(1)
  		end

  		it "redirects to game #show" do
  			post :create, game: attributes_for(:game)
  			expect(response).to redirect_to game_path(assigns(:game))
  	  end
  	end

  	context "with invalid attributes" do
  	end
  end

  describe 'GET #edit do' do
  	it "assigns the requested game to @game" do
  		game = create(:game)
  		get :edit, id: game
  		expect(assigns(:game)).to eq game
  	end
  end
end
