class EconomyParticipation < ActiveRecord::Base
	
	after_save :set_data_into_redis

	private

	def set_data_into_redis
		REDIS_CLIENT.SADD("economy_participations", "economy_participation:#{self.id}")
		REDIS_CLIENT.HMSET("economy_participation:#{self.id}", "lower_limit", self.lower_limit, "upper_limit", self.upper_limit, "winner_points", self.winner_points, "other_winner_points", self.other_winner_points, "participation_point", self.participation_point, "stopper", self.stopper)
	
	end

end
