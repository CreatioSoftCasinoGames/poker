class Api::V1::UsersController < Api::V1::ApplicationController

	def create
		params[:password] = "temp1234" if params[:password].blank?
		@user = User.new(email: params[:email], password: params[:password], password_confirmation: params[:password], first_name: params[:first_name], last_name: params[:last_name], fb_id: params[:fb_id])
		if @user.save
			render json: {
				user: @user,
				valid: true
			}
		else
			render json: {
				user: @user,
				valid: false,
				errors: @user.errors.full_messages.join(", ")
			}
		end
	end

	def update
		@user = User.where(id: params[:id]).first
		if @user.update_attributes(user_params)
			render json: {
				user: UserSerializer.new(@user),
				valid: true
			}
		else
			render json: {
				user: @user,
				valid: false,
				errors: @user.errors.full_messages.join(", ")
			}
		end
	end

	def freind_request
		@user = User.where(id: params[:id]).first
		@requested_friend = User.where(id: params[:requested_to]).first
		if @requested_friend.present?
			@friend_request = FriendRequest.new(user_id: params[:id], requested_to: params[:requested_to])
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

	def update_status
		@user = User.where(id: params[:id])
		@friend_request = FriendRequest.where(user_id: params[:requested_to], requested_to: params[:id]).first
		if @friend_request.update_attributes(status: params[:status])
			@success = true
		else
			@success = false
			@message = @friend_request.errors.full_messages.join(", ")
		end
		if @friend_request.status == 1
			@friend = Friend.new(user_id: params[:requested_to], friend_id: params[:id])
			if @friend.save
				@fsuccess = true
			else
				@fsuccess = false
				@message = @friend.errors.full_messages.join(", ")
			end
		end
		render json: {
			success: @success,
			friend_request: @friend_request,

			fsuccess: @fsuccess,
			friend: @friend,

			errors: @message

		}
	end

	def show
		@user = User.where(id: params[:id]).first
		render json: @user
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :image, :fb_id, :email, :device_avatar_id)
	end

end