class Api::V1::RoomsController < Api::V1::ApplicationController

	def index
		@rooms = Room.all
		render json: @rooms
	end

end