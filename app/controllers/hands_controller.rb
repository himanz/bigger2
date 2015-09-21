class HandsController < ApplicationController
	def index
		@hands = Hand.where(game_id: params[:game_id])
	end

	def show
		@hand = Hand.find(params[:id])
	end

	def new
		@hand = Hand.new
	end
end
