class HandsController < ApplicationController
	def index
		@hands = Hand.where(game_id: params[:game_id])
	end
end
