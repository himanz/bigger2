class RulesController < ApplicationController
	def index
		@rules = Rule.all
	end

	def show
    @rule = Rule.find(params[:id])
	end

	def new
    @rule = Rule.new
	end

	def create
		@rule = Rule.new(rules_params)
		@rule.save
	end

	def edit
		@rule = Rule.find(params[:id])
	end

	def update
		@rule = Rule.find(params[:id])
		if @rule.update(rules_params)
			redirect_to @rule
		else
      render :edit
		end
	end

	private

	def rules_params
		params.require(:rule).permit(:title, :winner_points, :winner_points_amount, :line1_min, :line1_max, :line1_multiplier,
			                           :line2_min, :line2_max, :line2_multiplier,
			                           :line3_min, :line3_max, :line3_multiplier,
			                           :line4_min, :line4_max, :line4_multiplier,
			                           :line5_min, :line5_max, :line5_multiplier)
	end
end
