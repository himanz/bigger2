require 'rails_helper'

RSpec.describe RulesController, type: :controller do
  describe 'GET#index' do
  	context 'without params' do
  		it "populates an array with all the rules" do
  			rule1 = create(:rule)
  			rule2 = create(:rule, title: "Second")
  			get :index
  			expect(assigns(:rules)).to match_array([rule1, rule2])
  		end

  		it "renders the :index view" do
  			get :index
  			expect(response).to render_template :index
  		end
  	end
  end

  describe 'GET#show' do
  	it "assigns the correct rule to @rule" do
  		rule = create(:rule)
  		get :show, id: rule
  		expect(assigns(:rule)).to eq rule
  	end

  	it "renders the :show view" do
  		rule = create(:rule)
  		get :show, id: rule
  		expect(response).to render_template :show
  	end
  end

  describe 'GET #new' do
  	it "assigns a new rule to @rule" do
  		get :new
  		expect(assigns(:rule)).to be_a_new(Rule)
  	end
  end

  describe 'POST #create' do
  	context "with valid attributes" do
  		it "saves the new rule in the database" do
  			expect{
  				post :create, rule: attributes_for(:rule)
  			}.to change(Rule, :count).by(1)
  		end
  	end

  	context "with invalid attributes" do
  		it "does not save the new rule in the database" do
	  		expect{
	  			post :create, rule: attributes_for(:rule, title: nil)
	  		}.to change(Rule, :count).by(0)
  	  end
  	end
  end

  describe 'GET #edit' do
  	it "assigns the requested game to @rule" do
  		rule = create(:rule)
  		get :edit, id: rule
  		expect(assigns(:rule)).to eq rule
  	end

  	it "renders the :edit template" do
  		rule = create(:rule)
  		get :edit, id: rule
  		expect(response).to render_template :edit
  	end
  end

  # describe "PATCH #update" do
  # 	before :each do
  # 		@game = create(:game)
  # 	end

  # 	context "with valid attributes" do
  # 		it "located the requested @game" do
  # 			patch :update, id: @game, game: attributes_for(:game)
  # 			expect(assigns(:game)).to eq @game
  # 		end

  # 		it "changes the @game's attributes" do
  # 			patch :update, id: @game, game: attributes_for(:game, name: "Changed it")
  # 			@game.reload
  # 			expect(@game.name).to eq "Changed it"
  # 			expect(@game.players_count).to eq @game.players_count
  # 			expect(@game.amount_per_card).to eq @game.amount_per_card
  # 		end

  # 		it "redirects to the updated game" do
  # 			patch :update, id: @game, game: attributes_for(:game, name: "Changed it")
  # 			expect(response).to redirect_to @game
  # 		end
  # 	end

  # 	context "with invalid attributes" do
  # 		it "does not change the company's attributes" do
  # 			game_info = @game
  # 			patch :update, id: @game, game: attributes_for(:game, name: nil)
  # 			@game.reload
  # 			expect(@game.name).to eq game_info.name
  # 			expect(@game.players_count).to eq game_info.players_count
  # 			expect(@game.amount_per_card).to eq game_info.amount_per_card
  # 		end

  # 		it "re-renders the edit template" do
  # 			patch :update, id: @game, game: attributes_for(:game, name: nil)
  # 			expect(response).to render_template :edit
  # 		end
  # 	end
  # end
end