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

  describe 'GET#show' do
    it "assigns the correct hand to @hand" do
      game = create(:game)
      hand = create(:hand, game_id: game.id)
      get :show, game_id: game.id, id: hand.id
      expect(assigns(:hand)).to eq hand
    end

    it "renders the :show view" do
      game = create(:game)
      hand = create(:hand, game_id: game.id)
      get :show, game_id: game.id, id: hand.id
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    it "assigns a new game to @hand" do
      game = create(:game)
      get :new, game_id: game.id
      expect(assigns(:hand)).to be_a_new(Hand)
    end
  end

  # describe 'POST #create' do
  #   context "with valid attributes" do
  #     it "saves the new game in the database" do
  #       expect{
  #         post :create, game: attributes_for(:game)
  #       }.to change(Game, :count).by(1)
  #     end

  #     it "redirects to game #show" do
  #       post :create, game: attributes_for(:game)
  #       expect(response).to redirect_to game_path(assigns(:game))
  #     end
  #   end

  #   context "with invalid attributes" do
  #     it "does not save the new game in the database" do
  #       expect{
  #         post :create, game: attributes_for(:game, name: nil)
  #       }.to change(Game, :count).by(0)
  #     end

  #     it "re-renders new template" do
  #       post :create, game: attributes_for(:game, name: nil)
  #       expect(response).to render_template :new
  #     end
  #   end
  # end
end
