class TournamentUser < ActiveRecord::Base

	belongs_to :tournament
	belongs_to :user

	def full_name
		user.full_name
	end

	def image_url
		user.image_url
	end

	def device_avatar_id
		user.device_avatar_id
	end

	def reward
		user_rewards = REDIS_CLIENT.ZRANGEBYSCORE("reward_level_sorted_set", self.chips, "+inf", "limit", 0, 1)
		rewards_detail = REDIS_CLIENT.HGETALL(user_rewards)
		rewards_detail.in_groups_of(2).to_h["reward"]
	end

	def level
		user_levels = REDIS_CLIENT.ZRANGEBYSCORE("reward_level_sorted_set", self.chips, "+inf", "limit", 0, 1)
		level_details = REDIS_CLIENT.HGETALL(user_levels)
		level_details.in_groups_of(2).to_h["level"]
	end
	
end
