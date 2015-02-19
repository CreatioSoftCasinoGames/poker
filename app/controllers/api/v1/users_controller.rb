class Api::V1::UsersController < Api::V1::ApplicationController

	before_action :find_user, only: [:show, :update, :my_friends, :my_friend_requests, :friend_request_sent, :send_in_game_gift, :gift_sent, :gift_received, :asked_for_gift_to, :asked_for_gift_by, :my_gifts]

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
				user: @user.as_json({
						only: user_params.keys
					}),
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

	def friend_request_sent
		@friend_requests = @user.friend_requests.where(confirmed: false)
		render json: {
			requests: @friend_requests.as_json({
				only: [:id, :user_id, :requested_to_id, :confirmed],
				methods: [:full_name, :device_avatar_id]
			})
		}
	end

	def my_friend_requests
		user_id = @user.id
		@friend_requests = FriendRequest.where(requested_to_id: user_id, confirmed: false)
		render json: {
			requests: @friend_requests.as_json({
				only: [:id, :user_id, :requested_to_id, :confirmed],
				methods: [:full_name, :device_avatar_id]
			})
		}
	end

	def send_in_game_gift
		@in_game_gifts = InGameGift.all
		render json: {
			gifts_available: @in_game_gifts.as_json({
				only: [:name, :cost],
				methods: [:full_name, :device_avatar_id]
			})
		}
	end

	def my_friends
		render json: {
			friends: @user.friends.as_json({
				only: [:login_token, :device_avatar_id],
				methods: [:full_name]
			})
		}
	end

	def gift_sent
		@sent_gift = @user.gift_requests.where(is_requested: false)
		render json: {
			sent_gift: @sent_gift.as_json({
				only: [:id, :user_id, :send_to_id, :confirmed],
				methods: [:full_name, :device_avatar_id]
			})
		}
	end

	def gift_received
		@received_gift = GiftRequest.where(send_to_id: @user.id, confirm: false)
		render json: {
			received_gift: @received_gift.as_json({
				only: [:id, :user_id, :send_to_id, :confirmed],
				methods: [:full_name, :device_avatar_id]
			})
		}
	end

	def asked_for_gift_to
		@gift_asked_to = @user.gift_requests.where(is_requested: true)
		render json: {
			gift_asked_to: @gift_asked_to.as_json({
				only: [:id, :user_id, :send_to_id, :confirmed],
				methods: [:full_name, :device_avatar_id]
			})
		}
	end

	def asked_for_gift_by
		@gift_asked_by = GiftRequest.where(send_to_id: @user.id, is_requested: true)
		render json: {
			gift_asked_by: @gift_asked_by.as_json({
				only: [:id, :user_id, :send_to_id, :confirmed],
				methods: [:full_name, :device_avatar_id]
			})
		}
	end
	
	def show
		render json: @user
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :password, :chips, :password_confirmation, :image, :fb_id, :email, :device_avatar_id, :shootout_level, :diamonds, :xp, :level_precentage)
	end

	def find_user
		@user = User.where(login_token: params[:id]).first
	end

end