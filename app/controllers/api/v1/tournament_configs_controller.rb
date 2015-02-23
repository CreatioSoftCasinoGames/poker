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
		else
			@tournament_users = @tournament_config.tournaments.active.first.tournament_users.order("chips desc").limit(300)
			my_rank = @tournament_config.tournaments.active.first.tournament_users.order('chips DESC').map(&:user_id).index(@user.id).to_f + 1
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
			my_rank: my_rank
		}
	end

end