class UtilityController < ApplicationController

	def show_api_key
		@api_key = ApiKey.where(active: true).first
	end

	def generate_api_key 
		ApiKey.create
		redirect_to show_api_key_url, flash: {success: "New keys created successfully !"}
	end

	def sync_data
		TableConfig.includes(:tables).all.each do |table_config|
			REDIS_CLIENT.SADD("table_configs", "table_config:#{table_config.id}")
			REDIS_CLIENT.HMSET("table_config:#{table_config.id}", "name", table_config.name, "min_player", table_config.min_player, "max_player", table_config.max_player, "small_blind", table_config.small_blind, "big_blind", table_config.big_blind, "min_buy_in", table_config.min_buy_in, "max_buy_in", table_config.max_buy_in, "game_type", table_config.game_type, "shootout_level", table_config.shootout_level, "fee", table_config.fee, "pot", table_config.pot);
			table_config.tables.each do |table|
				REDIS_CLIENT.SADD("tables","table:#{table.id}")
				REDIS_CLIENT.SADD("table_config_tables:#{table.table_config_id}", "table:#{table.id}")
				REDIS_CLIENT.ZADD("table_config_occupancy:#{table.table_config_id}", 0, "table:#{table.id}")
				REDIS_CLIENT.HMSET("table:#{table.id}", "name", table.name, "table_config_id", table.table_config_id)
			end
		end

		EconomyParticipation.all.each do |economy_participation|
			REDIS_CLIENT.ZADD("economy_participation_sorted_set", economy_participation.upper_limit, "economy_participation:#{economy_participation.id}")
			REDIS_CLIENT.HMSET("economy_participation:#{economy_participation.id}", "lower_limit", economy_participation.lower_limit, "upper_limit", economy_participation.upper_limit, "winner_points", economy_participation.winner_points, "other_winner_points", economy_participation.other_winner_points, "participation_point", economy_participation.participation_point, "stopper", economy_participation.stopper)
		end
 
		EconomyHand.all.each do |economy_hand|
			REDIS_CLIENT.SADD("economy_hands", "economy_hand:#{economy_hand.hand_quality}")
			REDIS_CLIENT.HMSET("economy_hand:#{economy_hand.hand_quality}", "winner_point", economy_hand.winner_point, "other_winner_point", economy_hand.other_winner_point)
		end

		EconomyBet.all.each do |economy_bet|
			REDIS_CLIENT.ZADD("economy_bet_sorted_set", economy_bet.upper_limit, "economy_bet:#{economy_bet.id}")
			REDIS_CLIENT.HMSET("economy_bet:#{economy_bet.id}", "lower_limit", economy_bet.lower_limit, "upper_limit", economy_bet.upper_limit, "points", economy_bet.points)
		end

		EconomyRange.all.each do |economy_range|
			REDIS_CLIENT.ZADD("economy_range_sorted_set", economy_range.upper_limit, "economy_range:#{economy_range.id}")
			REDIS_CLIENT.HMSET("economy_range:#{economy_range.id}", "lower_limit", economy_range.lower_limit, "upper_limit", economy_range.upper_limit, "level", economy_range.level)
		end

		redirect_to root_path, flash: {success: "Data successfully sinked !" }
	end

end