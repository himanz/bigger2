require 'rails_helper'

RSpec.describe ScoresController, type: :controller do
  describe 'GET #new' do
  	it "assigns a new score to @score" do
  		get :new
  		expect(assigns(:score)).to be_a_new(Score)
  	end
  end
end
