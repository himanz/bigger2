class RulesController < ApplicationController
	def index
		@rules = Rule.all
	end

	def show
    @rule = Rule.find(params[:id])
	end
end
