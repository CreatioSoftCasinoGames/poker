class Api::V1::TablesController < Api::V1::ApplicationController

	def create
		@table = Table.new(table_config_id: params[:table_config_id])
		if @table.save
			render json: {
				table: @table,
				valid: true
			}
		else
			render json: {
				errors: @table.errors.full_messages.join(", "),
				valid: false
			}
		end
	end
	
end