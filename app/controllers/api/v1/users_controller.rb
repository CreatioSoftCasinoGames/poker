class Api::V1::UsersController < Api::V1::ApplicationController

	before_action :find_user, only: [:show, :update, :my_friends]

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

	def my_friend_requests
		@friend_requests = FriendRequest.where(requested_to_id: params[:id], status: false)
		render json: @friend_requests
		
	end

	def my_friends
		@friends = @user.friends
		render json: @friends
	end

	def show
		render json: @user
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :image, :fb_id, :email, :device_avatar_id)
	end

	def find_user
		@user = User.where(login_token: params[:id]).first
	end

end