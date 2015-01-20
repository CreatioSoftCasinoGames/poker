class FriendRequest < ActiveRecord::Base
	belongs_to :user
	before_update :update_friend

	def update_friend
		if status
			Friendship.create(user_id: self.user_id, friend_id: self.requested_to_id)
			Friendship.create(friend_id: self.user_id, user_id: self.requested_to_id)
		end
	end
end