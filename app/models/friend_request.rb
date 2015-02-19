class FriendRequest < ActiveRecord::Base

	belongs_to :user
	has_many :friend_requests_sent
	before_update :update_friend
	validate :search_requested_friend, on: :create
	validate :valid_request, :on => :create
	attr_accessor :requested_to_id

	def update_friend
		if confirmed
			Friendship.create(user_id: self.user_id, friend_id: self.requested_to_id)
			Friendship.create(friend_id: self.user_id, user_id: self.requested_to_id)
		end
	end

	def user_login_token
		User.where(id: self.user_id).first.login_token
	end

	def requested_to_token
		User.where(id: self.requested_to_id).first.login_token
	end

	def device_avatar_id
		user.device_avatar_id
	end

	def full_name
		[user.first_name, user.last_name].join(" ")
	end

	private

	def search_requested_friend
		requested_to = User.where(login_token: requested_to_id).first
		unless requested_to.blank?	
			self.requested_to_id = requested_to.id
		else
			self.errors.add(:base, "Requested User not present")
		end
	end

	def valid_request
		if FriendRequest.where(user_id: [user_id, requested_to_id], requested_to_id: [user_id, requested_to_id]).present?
			self.errors.add(:base, "Already requested friend")
		end
	end
	
end
