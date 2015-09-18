require 'rails_helper'

RSpec.describe RostersController, type: :controller do
  describe 'GET #new' do
  	it "assigns a new roster to @roster" do
  		get :new
  		expect(assigns(:roster)).to be_a_new(Roster)
  	end
  end

  describe 'POST #create' do
  	context "with valid attributes" do
  		it "saves the new roster in the database" do
  			expect{
  				post :create, roster: attributes_for(:roster)
  			}.to change(Roster, :count).by(1)
  		end
  	end

  	context "with invalid attributes" do
  		it "does not save the new roster in the database" do
	  		expect{
	  			post :create, roster: attributes_for(:roster, game_id: nil)
	  		}.to change(Roster, :count).by(0)
  	  end
  	end
  end
end
