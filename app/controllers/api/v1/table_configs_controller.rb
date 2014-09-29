class Api::V1::TableConfigsController < Api::V1::ApplicationController

	def index
		@table_configs = TableConfig.all
		render json: @table_configs
	end

end