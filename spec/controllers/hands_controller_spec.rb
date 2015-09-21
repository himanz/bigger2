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

  describe 'POST #create' do
    context "with valid attributes" do
      it "saves the new hand in the database" do
        game = create(:game)
        expect{
          post :create, hand: attributes_for(:hand, game_id: game.id), game_id: game.id
        }.to change(Hand, :count).by(1)
      end

      it "redirects to hand #index with game id paramter" do
        game = create(:game)
        post :create, hand: attributes_for(:hand, game_id: game.id), game_id: game.id
        expect(response).to redirect_to game_hands_path(game.id)
      end
    end

    context "with invalid attributes" do
      it "does not save the new hand in the database" do
        game = create(:game)
        expect{
          post :create, hand: attributes_for(:hand, game_id: nil), game_id: game.id
        }.to change(Hand, :count).by(0)
      end

      it "re-renders new template" do
        game = create(:game)
        post :create, hand: attributes_for(:hand, game_id: nil), game_id: game.id
        expect(response).to render_template :new, game.id
      end
    end
  end
end
