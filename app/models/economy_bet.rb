class EconomyBet < ActiveRecord::Base

	after_save :set_data_into_redis

	private

	def set_data_into_redis
		REDIS_CLIENT.SADD("economy_bets", "economy_bet:#{self.id}")
		REDIS_CLIENT.HMSET("economy_bet:#{self.id}", "lower_limit", lower_limit, "upper_limit", upper_limit, "points", points)
		
	end

end
