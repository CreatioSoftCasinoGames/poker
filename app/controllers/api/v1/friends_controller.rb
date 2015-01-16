class Api::V1::FriendsController < Api::V1::ApplicationController
	
	def create
		@friend = Friend.save(friend_params)
		if @friend.save
			render json: @friend
		else
			errors: @friend.errors.full_messages.join
		end
	end

	def update
		@friend = Friend.find(params[:id])
		if @friend.update_attributes(friend_params)
			render json: @friend
		else
			render json: {
				errors: @friend.errors.full_messages.join(", ")
			}
		end
	end

	def show
		@friend = Friend.find(params[:id])
		render json: @friend
	end

end