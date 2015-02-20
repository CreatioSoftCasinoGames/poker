class Api::V1::FriendRequestsController < Api::V1::ApplicationController

	#skip_before_filter :authenticate_user

	before_action :get_friend_requests, only: [:show, :destroy, :update]
	def create
		@friend_request = current_user.friend_requests_sent.build(requested_to_id: params[:requested_to_id])
		if @friend_request.save
			p params[:requested_to_id]
			render json: @friend_request
		else
			render json: {
				errors: @friend_request.errors.full_messages.join(", ")
			}
		end
	end

	def update
		if @friend_request.update_attributes(friend_request_params)
			render json: @friend_request
		else
			render json: {
				errors: @friend_request.errors.full_messages.join
			}
		end
	end

	def destroy
		@friend_request.destroy
		render json:{
			message: "Request deleted!"
		}
	end

	def show
		render json: @friend_request
	end

	private

	def current_user
		User.where(login_token: params[:login_token]).first
	end

	def friend_request_params
		params.require(:friend_request).permit(:confirmed)
	end

	def get_friend_requests
		@friend_request = FriendRequest.where(id: params[:id]).first
	end

end