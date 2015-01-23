class UtilityController < ApplicationController

	def show_api_key
		@api_key = ApiKey.where(active: true).first
	end

	def generate_api_key 
		ApiKey.create
		redirect_to show_api_key_url, flash: {success: "New keys created successfully !"}
	end

	def sink_data
		@table_configs = TableConfig.includes(:tables).all
		@table_configs.each do |table_config|
			REDIS_CLIENT.SADD("table_configs", "table_config:#{table_config.id}")
			REDIS_CLIENT.HMSET("table_config:#{table_config.id}", "name", table_config.name, "small_blind", table_config.small_blind, "big_blind", table_config.big_blind, "min_player", table_config.min_player, "max_player", table_config.max_player, "min_buy_in", table_config.min_buy_in, "max_buy_in", table_config.max_buy_in, "game_type", table_config.game_type, "pot", table_config.pot, "fee", table_config.fee)			
			table_config.tables.each do |table|
				REDIS_CLIENT.SADD("tables","table:#{table.id}")
				REDIS_CLIENT.SADD("table_config_tables:#{table.table_config_id}", "table:#{table.id}")
				REDIS_CLIENT.SADD("table:entrable", "tabel:#{table.id}")
				REDIS_CLIENT.HMSET("table:#{table.id}", "name", table.name, "table_config_id", table.table_config_id)
			end
		end

		@economy_participations = EconomyParticipation.all
		@economy_participations.each do |economy_participation|
			REDIS_CLIENT.SADD("economy_participations", "economy_participation:#{economy_participation.id}")
			REDIS_CLIENT.HMSET("economy_participation:#{economy_participation.id}", "lower_limit", economy_participation.lower_limit, "upper_limit", economy_participation.upper_limit, "winner_points", economy_participation.winner_points, "other_winner_points", economy_participation.other_winner_points, "participation_point", economy_participation.participation_point, "stopper", economy_participation.stopper)
		end

		@economy_hands = EconomyHand.all
		@economy_hands.each do |economy_hand|
			REDIS_CLIENT.SADD("economy_hands", "economy_hand:#{economy_hand.id}")
			REDIS_CLIENT.HMSET("economy_hand:#{economy_hand.id}", "hand_quality", economy_hand.hand_quality, "winner_point", economy_hand.winner_point, "other_winner_point", economy_hand.other_winner_point)
		end

		@economy_bets = EconomyBet.all
		@economy_bets.each do |economy_bet|
			REDIS_CLIENT.SADD("economy_bets", "economy_bet:#{economy_bet.id}")
			REDIS_CLIENT.HMSET("economy_bet:#{economy_bet.id}", "lower_limit", economy_bet.lower_limit, "upper_limit", economy_bet.upper_limit, "points", economy_bet.points)
		end

		redirect_to root_path, flash: {success: "Data successfully sinked !" }
	end

end