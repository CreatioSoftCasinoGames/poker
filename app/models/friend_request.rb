class FriendRequest < ActiveRecord::Base

	belongs_to :user
	before_update :update_friend
	validate :valid_request, :on => :create

	def update_friend
		if confirm
			Friendship.create(user_id: self.user_id, friend_id: self.requested_to_id)
			Friendship.create(friend_id: self.user_id, user_id: self.requested_to_id)
		end
	end

	def device_avatar_id
		user.device_avatar_id
	end

	def full_name
		[user.first_name, user.last_name].join(" ")
	end

	private

	def valid_request
		if FriendRequest.where(user_id: [user_id, requested_to_id], requested_to_id: [user_id, requested_to_id]).present?
			self.errors.add(:base, "Already requested friend")
		end
	end
	
end
