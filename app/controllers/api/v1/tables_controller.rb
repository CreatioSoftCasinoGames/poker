class Api::V1::TablesController < Api::V1::ApplicationController

	def assign
		@user = User.where(id: params[:user_id]).first

		render json: {table_id: 1}
	end

end