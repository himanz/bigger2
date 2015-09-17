class GamesController < ApplicationController
	def index
		@games = Game.all
	end

	def show
		@game = Game.find(params[:id])
	end

	def new
		@game = Game.new
	end

	def create
		@game = Game.new(game_params)
		if @game.save
			redirect_to @game
		end
	end

	def edit
		@game = Game.find(params[:id])
	end
end

private

def game_params
	params.require(:game).permit(:name, :players, :amount_per_card)
end