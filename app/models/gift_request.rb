class GiftRequest < ActiveRecord::Base

	belongs_to :user
	attr_accessor :send_to_token
	has_many :gift_requests_sent
	validate :search_requested_friend, on: :create
	validate :valid_request, :on => :create
	before_create :set_coins

	def user_login_token
		User.where(id: self.user_id).first.login_token
	end

	def send_to_token
		User.where(id: self.send_to_id).first.login_token
	end

	def device_avatar_id
		user.device_avatar_id
	end

	def full_name
		[user.first_name, user.last_name].join(" ")
	end

	private

	def search_requested_friend
		send_to = User.where(login_token: send_to_token).first || LoginHistory.where(login_token: send_to_token).first.user
		unless send_to.blank?	
			self.send_to_id = send_to.id
		else
			self.errors.add(:base, "Requested User not present")
		end
	end

	def set_coins
		user_chips = User.where(id: user_id).pluck(:chips).first
		chips = user_chips.to_f - 1000
		user.update_attributes(chips: chips)
	end

	def valid_request
		if Friendship.where(user_id: user_id, friend_id: send_to_id).blank?
			self.errors.add(:base, "Requested user is not your friend! You can send gift only to your friend.")
		end
	end

end
