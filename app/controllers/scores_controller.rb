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

	def update
		@score = Score.find(params[:id])
		@game = @score.hand.game
		if @score.update(score_params)
			redirect_to game_path(@game.id)
		else
			render :edit
		end
	end

	private

	def score_params
		params.require(:score).permit(:cards_left, :points, :hand_id, :player_id)
	end
end
