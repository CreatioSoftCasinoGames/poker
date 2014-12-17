class Api::V1::TableConfigsController < Api::V1::ApplicationController

	def index
		@table_configs = TableConfig.all
		render json: @table_configs
	end

	def get_game_type
		@table_configs = TableConfig.where(game_type: params[:game_type])
		table_obj = @table_configs.collect(&:tables).flatten.uniq.collect do |table|
			{
				id: table.id,
				name: table.name,
				min_buy_in: table.table_config.min_buy_in,
				max_buy_in: table.table_config.max_buy_in,
				min_player: table.table_config.min_player,
				max_player: table.table_config.max_player,
				big_blind: table.table_config.big_blind,
				small_blind: table.table_config.small_blind,
				game_type: table.table_config.game_type
			}
		end
		render json: table_obj
	end


end