class Api::V1::GiftRequestsController < Api::V1::ApplicationController

	before_action :set_gift_request, only: [:update, :show, :destroy]

	def create
		params[:is_asked] = false if params[:is_asked].blank?
		@gift_request = current_user.gift_requests_sent.new(user_id: params[:user_id], send_to_id: params[:send_to_id], gift_type: params[:gift_type], is_requested: params[:is_asked])
		if @gift_request.save
			render json: @gift_request
		else
			render json: {
				errors: @gift_request.errors.full_messages.join(", ")
			}
		end
				
	end

	def current_user
		User.where(login_token: params[:user_id]).first
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