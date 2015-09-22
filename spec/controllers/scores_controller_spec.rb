require 'rails_helper'

RSpec.describe ScoresController, type: :controller do
  describe 'GET #new' do
  	it "assigns a new score to @score" do
  		get :new
  		expect(assigns(:score)).to be_a_new(Score)
  	end
  end

  describe 'POST #create' do
    context "with valid attributes" do
      it "saves the new score in the database" do
      	score = create(:score)
        expect{
          post :create, score: attributes_for(:score)
        }.to change(Score, :count).by(1)
      end

      # it "redirects to game #show with game id parameter" do
      # 	game = create(:game)
      # 	hand = create(:hand, game_id: game.id)
      #   post :create, score: attributes_for(:score, hand_id: hand.id, player_id: Player.where(name: game.player1).first.id)
      #   expect(response).to redirect_to game_path(game.id)
      # end
    end

    context "with invalid attributes" do
      it "does not save the new hand in the database" do
      	score = create(:score)
        expect{
          post :create, score: attributes_for(:score, hand_id: nil)
        }.to change(Score, :count).by(0)
      end

      it "re-renders new template" do
        post :create, score: attributes_for(:hand, hand_id: nil)
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #edit' do
  	it "assigns the requested score to @score" do
  		score = create(:score)
  		get :edit, id: score
  		expect(assigns(:score)).to eq score
  	end

  	it "renders the :edit template" do
  		score = create(:score)
  		get :edit, id: score
  		expect(response).to render_template :edit
  	end
  end
end
