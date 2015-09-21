class ScoresController < ApplicationController
	def new
		@score = Score.new
	end
end
