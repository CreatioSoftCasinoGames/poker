class Api::V1::SessionsController < Api::V1::ApplicationController

	def create
		if params[:fb_id] && params[:device_id]
			if User.where(fb_id: params[:fb_id]).first.blank?
				@guest_user = User.where(device_id: params[:device_id], is_facebook_connected: false).first
				if @guest_user.present?
					@user = @guest_user.dup
					@user.attributes = {device_id: nil, is_guest: nil, fb_id: params[:fb_id], email: "fb"+SecureRandom.hex(5)+"@pkrapi.com"}
					if @user.save
						@guest_user.update_attributes(is_facebook_connected: true)
						p @guest_user
						@success = true
						@new_user = true
					else
						@success = false
						@messages = @user.errors.full_messages.join(", ")
					end
				else
					@messages = "Guest user not present!"
				end
			else
				@messages = "Allready connected with facebook!"
			end
		else
			if params[:fb_id]
				@user = User.where(fb_id: params[:fb_id]).first_or_initialize
				if @user.new_record?
					@user.attributes = {email: params[:email], first_name: params[:first_name], last_name: params[:last_name], fb_friend_list: params[:fb_friend_list]}
					if @user.save
						@success = true
						@new_user = true
					else
						@success = false
						@messages = @user.errors.full_messages.join(", ")
					end
				end
			else
				if params[:email] && params[:password]
					@user = User.where(email: params[:email]).first
					(@user = nil) unless @user.try(:valid_password?, params[:password])
					@success = !@user.blank?
				else
					if params[:is_guest] && params[:device_id]
						@user = User.where(device_id: params[:device_id], is_guest: true).first_or_initialize
						if @user.new_record?
							if @user.save
								@success = true
							else
								@success = false
								@messages = @user.errors.full_messages.join(", ")
							end
						end
					end
				end
			end
		end
		if @user.present?
			login_token = SecureRandom.hex(5)
			if @user.update_attributes(login_token: login_token, online: true, login_histories_attributes: {id: nil, active: true, login_token: login_token })
				@user.new_fb_user = @new_user
				render json: @user
			else
				render json: @user.errors.full_messages.join(", ")
			end
		else
			render json: @messages
		end
	end

	def destroy
		@user = User.where(login_token: params[:id]).first
	
		if @user.present?
			login_history_id = @user.login_histories.where(login_histories: {login_token: params[:id]}).first.id
			if @user.update_attributes(online: false, login_histories_attributes: {id: login_history_id ,active: false})
				REDIS_CLIENT.srem("game_players", "game_player:#{params[:id]}")
				render json: {
					success: true,
					message: "You have been signed out successfully!"
				}
			else
				render json: {
					error: @user.errors.full_messages.join(", ")
				}
			end
		else
			render json: {
				success: false,
				message: "Session does not exists"
			}
		end
	end

	# def connect_facebook
	# 	@user = User.where(login_token: params[:id]).first
	# 	if @user.is_guest? && !@user.is_facebook_connected?
	# 		@new_user = @user.dup
	# 		# @new_user.attributes = {device_id: nil, is_guest: nil, fb_id: params[:fb_id], login_token: SecureRandom.hex(5)}
	# 		if @new_user.save
	# 			@user.update_attributes(is_facebook_connected: true)
	# 			@new_user.update_attributes(device_id: nil, is_guest: nil, fb_id: params[:fb_id], login_token: SecureRandom.hex(5))
	# 			render json: {
	# 				message: "Successfully synced!",
	# 				user: @new_user
	# 			}
	# 		else
	# 			render json: {
	# 				message: "Problem in sync may be you have allready synced!"
	# 			}
	# 		end
	# 	else
	# 		render json: {
	# 			message: "Only guest user can synced with facebook!"
	# 		}
	# 	end
	# end

end