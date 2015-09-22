class ScoresController < ApplicationController
	def new
		@score = Score.new
	end

	def create
		@score = Score.new(score_params)
		if @score.save
		else
			render :new
		end
	end

	def edit
		@score = Score.find(params[:id])
	end

	private

	def score_params
		params.require(:score).permit(:cards_left, :points, :hand_id, :player_id)
	end
end
