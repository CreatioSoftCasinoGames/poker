class Api::V1::GiftRequestsController < Api::V1::ApplicationController

	before_action :set_gift_request, only: [:update, :show, :destroy]

	def create
		@user = User.where(login_token: params[:login_token]).first
		if @user.present?
			user_id = @user.id
			@send_to = LoginHistory.where(login_token: params[:send_to_token]).first
			if @send_to.present?
				send_to_id = @send_to.id
				@friend = Friendship.where(user_id: user_id, friend_id: send_to_id).first
				if @friend.present?
					is_requested = false if params[:is_asked].blank?
					@gift_request = GiftRequest.new(user_id: user_id, send_to_id: send_to_id, gift_type: params[:gift_type], is_requested: params[:is_asked])
					if @gift_request.save
						render json: @gift_request
					else
						render json: {
							errors: @gift_request.errors.full_messages.join(", ")
						}
					end
				else
					render json: {
						errors: "You are not friend! You can send gift to your friends only."
					}
				end
			else
				render json:{
					error: "User is not present to whom you want to gift!"
				}
			end
		else
			render json: {
				error: "You are not logged in! Log in first to send gifts."
			}
		end
	end

	def update
		if @gift_request.update_attributes(gift_request_params)
			render json: @gift_request
		else
			render json: {
				error: @gift_request.errors.full_messages.join(", ")
			}
		end
	end

	def show
		render json: @gift_request
	end

	def destroy
		@gift_request.destroy
		render json: {
			message: "Gift successfully deleted!"
		}
	end

	private

	def gift_request_params
		params.require(:gift_request).permit(:confirm)
	end

	def set_gift_request
		@gift_request = GiftRequest.where(id: params[:id]).first
	end

end