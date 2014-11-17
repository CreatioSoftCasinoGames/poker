class Api::V1::GamesController < Api::V1::ApplicationController

	def create
		@game = Game.new(game_params)
		if @game.save
			render json: {
				table: @table,
				valid: true
			}
		else
			render json: {
				errors: @game.errors.full_messages.join(", "),
				valid: false
			}
		end
	end

	private

	def game_params
		params.require(:game).permit(:current_user_id, :pot_value, :round_name, :table_id, deck: [])
	end

end