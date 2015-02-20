class Api::V1::TournamentConfigsController < Api::V1::ApplicationController

	def leader_board
		@tournament_config = TournamentConfig.where(id: params[:id]).first
		@user = User.fetch_by_login_token(params[:login_token])
		leader_board = @tournament_config.tournaments.active.first.tournament_users.order("chips desc").limit(300).as_json({
			only: [:chips],
			methods: [:full_name, :image_url]
		}).each_with_index.map do |player_obj, i|
			player_obj[:rank] = i + 1
			player_obj
		end
		render json: {
			leader_board: leader_board,
			my_rank: @tournament_config.tournaments.active.first.tournament_users.order('chips DESC').map(&:user_id).index(@user.id).to_f + 1
		}
	end

end