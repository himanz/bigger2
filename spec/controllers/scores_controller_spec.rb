require 'rails_helper'

RSpec.describe ScoresController, type: :controller do
  describe 'GET #new' do
  	it "assigns a new score to @score" do
  		get :new
  		expect(assigns(:score)).to be_a_new(Score)
  	end
  end

  describe 'POST #create' do
    before :each do
      @rule = create(:rule)
      @game = create(:game, rule_id: @rule.id)
      @hand = create(:hand, game_id: @game.id)
    end
    context "with valid attributes" do
      it "saves the new score in the database" do
        expect{
          post :create, score: attributes_for(:score, hand_id: @hand.id)
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
        expect{
          post :create, score: attributes_for(:score, hand_id: @hand.id, cards_left: nil)
        }.to change(Score, :count).by(0)
      end

      it "re-renders new template" do
        post :create, score: attributes_for(:hand, hand_id: nil)
        expect(response).to render_template :new
      end
    end
  end

  describe 'GET #edit' do
    before :each do
      @rule = create(:rule)
      @game = create(:game, rule_id: @rule.id)
      @hand = create(:hand, game_id: @game.id)
    end

  	it "assigns the requested score to @score" do
  		score = create(:score, hand_id: @hand.id)
  		get :edit, id: score
  		expect(assigns(:score)).to eq score
  	end

  	it "renders the :edit template" do
  		score = create(:score, hand_id: @hand.id)
  		get :edit, id: score
  		expect(response).to render_template :edit
  	end
  end

  describe "PATCH #update" do
  	before :each do
  		@rule = create(:rule)
      @game = create(:game, rule_id: @rule.id)
  		@hand = create(:hand, game_id: @game.id)
  		@score = create(:score, hand_id: @hand.id)
  	end

  	context "with valid attributes" do
  		it "located the requested @score" do
  			patch :update, id: @score, score: attributes_for(:score, hand_id: @hand.id)
  			expect(assigns(:score)).to eq @score
  		end

  		it "changes the @score's attributes" do
  			patch :update, id: @score, score: attributes_for(:score, cards_left: 2, hand_id: @hand.id)
  			@score.reload
  			expect(@score.cards_left).to eq(2)
  			expect(@score.hand_id).to eq @score.hand_id
  			expect(@score.player_id).to eq @score.player_id
  			# Implement when cards_left gets updated, to recalculate points
  		end

  		it "redirects to the associated game to score" do
  			patch :update, id: @score, score: attributes_for(:score, cards_left: 2, hand_id: @hand.id)
  			expect(response).to redirect_to game_path(@score.hand.game_id)
  		end
  	end

  	context "with invalid attributes" do
  		it "does not change the score's attributes" do
  			score_info = @score
  			patch :update, id: @score, score: attributes_for(:score, cards_left: nil)
  			@score.reload
  			expect(@score.cards_left).to eq score_info.cards_left
  			expect(@score.points).to eq score_info.points
  			expect(@score.hand_id).to eq score_info.hand_id
  		end

  		it "re-renders the edit template" do
  			patch :update, id: @score, score: attributes_for(:score, cards_left: nil)
  			expect(response).to render_template :edit
  		end
  	end
  end
end
