class EconomyHand < ActiveRecord::Base

	after_save :set_data_into_redis

	private

	def set_data_into_redis
		REDIS_CLIENT.SADD("economy_hands", "economy_hand:#{self.id}")
		REDIS_CLIENT.HMSET("economy_hand:#{self.id}", "hand_quality", self.hand_quality, "winner_point", self.winner_point, "other_winner_point", self.other_winner_point)
		
	end

end
