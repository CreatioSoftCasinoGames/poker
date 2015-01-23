class Api::V1::FriendRequestsController < Api::V1::ApplicationController

	#skip_before_filter :authenticate_user

	before_action :get_friend_requests, only: [:show, :destroy, :update]
	def create
		@user = User.where(login_token: params[:login_token]).first
		user_id = @user.id
		@requested_friend = User.where(login_token: params[:requested_token]).first
		requested_to_id = @requested_friend.id
		if @requested_friend.present?
			@friend_request = FriendRequest.new(user_id: user_id, requested_to_id: requested_to_id)
			if @friend_request.save
				render json: @friend_request
			else
				render json: {
					errors: @friend_request.errors.full_messages.join(", ")
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
		render json:{
			message: "Request deleted!"
		}
	end

	def show
		render json: @friend_request
	end

	private

	def friend_request_params
		params.require(:friend_request).permit(:confirm)
	end

	def get_friend_requests
		@friend_request = FriendRequest.where(id: params[:id]).first
	end

end