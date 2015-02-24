class Api::V1::TournamentConfigsController < Api::V1::ApplicationController

	def leader_board
		@tournament_config = TournamentConfig.where(id: params[:id]).first
		@user = User.fetch_by_login_token(params[:login_token])
		if params[:for] == "friends"
			@active_tournament_users = @tournament_config.tournaments.active.first.tournament_users
			tournament_user_ids = @active_tournament_users.pluck(:user_id)
			friend_ids = Friendship.where(user_id: @user.id, friend_id: tournament_user_ids).pluck(:friend_id) + [@user.id]
			@tournament_users = @active_tournament_users.where(user_id: friend_ids).order("chips desc").limit(100)
			my_rank = @active_tournament_users.where(user_id: friend_ids).order('chips DESC').map(&:user_id).index(@user.id).to_f + 1
			my_chips = @active_tournament_users.where(user_id: @user.id).first.chips
			user_rewards = REDIS_CLIENT.ZRANGEBYSCORE("reward_level_sorted_set", my_chips, "+inf", "limit", 0, 1)
			reward_details = REDIS_CLIENT.HGETALL(user_rewards)
			my_reward = reward_details.in_groups_of(2).to_h["reward"]
			my_level = reward_details.in_groups_of(2).to_h["level"]
		else
			@tournament_users = @tournament_config.tournaments.active.first.tournament_users.order("chips desc").limit(300)
			my_rank = @tournament_config.tournaments.active.first.tournament_users.order('chips DESC').map(&:user_id).index(@user.id).to_f + 1
			my_chips = @tournament_users.where(user_id: @user.id).first.chips
			user_rewards = REDIS_CLIENT.ZRANGEBYSCORE("reward_level_sorted_set", my_chips, "+inf", "limit", 0, 1)
			reward_details = REDIS_CLIENT.HGETALL(user_rewards)
			my_reward = reward_details.in_groups_of(2).to_h["reward"]
			my_level = reward_details.in_groups_of(2).to_h["level"]
		end
		leader_board = @tournament_users.as_json({
			only: [:chips],
			methods: [:full_name, :image_url, :device_avatar_id, :reward, :level]
		}).each_with_index.map do |player_obj, i|
			player_obj[:rank] = i + 1
			player_obj
		end
		render json: {
			leader_board: leader_board,
			my_rank: my_rank,
			my_chips: my_chips,
			my_reward: my_reward,
			my_level: my_level,
			remaining_time: @tournament_config.tournaments.active.first.created_at - Time.now + 24.hours
		}
	end

end