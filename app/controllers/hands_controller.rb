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

	def create
		@hand = Hand.new(hand_params)
		if @hand.save
			redirect_to game_hands_path(@hand.game_id)
		else
			render :new
		end
	end

	def destroy
		@hand = Hand.find(params[:id])
		if @hand.destroy
			redirect_to game_path(@hand.game_id)
		end
	end

	private

	def hand_params
		params.require(:hand).permit(:game_id)
	end
end
