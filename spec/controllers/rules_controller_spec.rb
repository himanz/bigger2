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

  describe "PATCH #update" do
  	before :each do
  		@rule = create(:rule)
  	end

  	context "with valid attributes" do
  		it "located the requested @rule" do
  			patch :update, id: @rule, rule: attributes_for(:rule)
  			expect(assigns(:rule)).to eq @rule
  		end

  		it "changes the @rule's attributes" do
  			patch :update, id: @rule, rule: attributes_for(:rule, line5_multiplier: 6)
  			@rule.reload
  			expect(@rule.line5_multiplier).to eq 6
  			expect(@rule.title).to eq @rule.title
  			expect(@rule.line1_min).to eq @rule.line1_min
  		end

  		it "redirects to the updated rule" do
  			patch :update, id: @rule, rule: attributes_for(:rule, line5_multiplier: 6)
  			expect(response).to redirect_to @rule
  		end
  	end

  	context "with invalid attributes" do
  		it "does not change the rule's attributes" do
  			rule_info = @rule
  			patch :update, id: @rule, rule: attributes_for(:rule, title: nil)
  			@rule.reload
  			expect(@rule.title).to eq rule_info.title
  			expect(@rule.line1_min).to eq rule_info.line1_min
  			expect(@rule.line5_multiplier).to eq rule_info.line5_multiplier
  		end

  		it "re-renders the edit template" do
  			patch :update, id: @rule, rule: attributes_for(:rule, title: nil)
  			expect(response).to render_template :edit
  		end
  	end
  end
end
