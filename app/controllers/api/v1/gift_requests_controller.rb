class Api::V1::GiftRequestsController < Api::V1::ApplicationController

	before_action :set_gift_request, only: [:update, :show, :destroy]

	def create
		params[:is_asked] = false if params[:is_asked].blank?
		@user = User.fetch_by_login_token(params[:login_token])
		@gift_request = @user.gift_requests_sent.build(send_token: params[:send_to_token], is_requested: params[:is_asked])
		if @gift_request.save
			render json: {
				success: true
			}
		else
			render json: {
				success: false,
				errors: @gift_request.errors.full_messages.join(", ")
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
			success: true
		}
	end

	private


	def gift_request_params
		params.require(:gift_request).permit(:confirmed)
	end

	def set_gift_request
		@gift_request = GiftRequest.where(id: params[:id]).first
		(render json: {message: "Gift request not found", success: false}) if @gift_request.blank?
	end

end