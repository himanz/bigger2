class RostersController < ApplicationController
	def new
		@roster = Roster.new
	end

	def create
		@roster = Roster.new(roster_params)
		@roster.save
	end

	private

	def roster_params
		params.require(:roster).permit(:game_id, :player_id)
	end
end
