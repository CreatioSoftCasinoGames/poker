class Api::V1::FriendRequestsController < Api::V1::ApplicationController

	before_action :get_friend_requests, only: [:show, :destroy, :update]
	def create
		@user = User.where(id: params[:id]).first
		@requested_friend = User.where(id: params[:requested_to]).first
		if @requested_friend.present?
			@friend_request = FriendRequest.new(user_id: params[:id], requested_to_id: params[:requested_to])
			if @friend_request.save
				render json: @user
			else
				render json: {
					errors: @friend.errors.full_messages.join(", ")
				}
			end
		else
			render json: {
				message: "Requested Friend not found"
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
	end

	def show
		render json: @friend_request
	end

	private

	def friend_request_params
		params.require(:friend_request).permit(:status)
	end

	def get_friend_requests
		@friend_request = FriendRequest.where(id: params[:id]).first
	end

end