class Score < ActiveRecord::Base
  before_save :multiplier

	validates :cards_left, :points, :hand_id, :player_id, presence: true
	belongs_to :hand

  # calculates points multiplier depending on rules
	def multiplier
		if self.cards_left >= self.hand.game.rule.line5_min && self.cards_left <= self.hand.game.rule.line5_max
			self.points = self.cards_left * self.hand.game.rule.line5_multiplier
		elsif self.cards_left >= self.hand.game.rule.line4_min && self.cards_left <= self.hand.game.rule.line4_max
			self.points = self.cards_left * self.hand.game.rule.line4_multiplier
		elsif self.cards_left >= self.hand.game.rule.line3_min && self.cards_left <= self.hand.game.rule.line3_max
			self.points = self.cards_left * self.hand.game.rule.line3_multiplier
		elsif self.cards_left >= self.hand.game.rule.line2_min && self.cards_left <= self.hand.game.rule.line2_max
			self.points = self.cards_left * self.hand.game.rule.line2_multiplier
		elsif self.cards_left >= self.hand.game.rule.line1_min && self.cards_left <= self.hand.game.rule.line1_max
			self.points = self.cards_left * self.hand.game.rule.line1_multiplier
		elsif self.cards_left == 0
			self.points = 0
		end
	end
end
