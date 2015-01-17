class Api::V1::FriendRequestController < Api::V1::ApplicationController
	def create
		@friend_request = FriendRequest.new(friend_request_params)
		if @friend_request.save
			render json: @friend_request
		else
			render json: {
				errors: @friend_request.errors.full_messages.join(", ")
			}
		end
	end

	def update
		@friend_request = FriendRequest.find(params[:id])
		if @friend_request.update_attributes(friend_request_params)
			render json: @friend_request
		else
			render json: {
				errors: @friend_request.errors.full_messages.join
			}
		end
	end

	def show
		@friend_request = FriendRequest.find(params[:id] or params[:requested_to])
		render json: @friend_request
	end

	private

	def friend_request_params
		params.require(:friend_request).permit(:requested_to, :status)
	end

end