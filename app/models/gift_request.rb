class GiftRequest < ActiveRecord::Base

	belongs_to :user
	attr_accessor :send_token
	has_many :gift_requests_sent
	validate :search_requested_friend, on: :create
	validate :send_once, on: :create
	validate :valid_request, :on => :create
	validate :validate_max_send, :on => :create
	validate :validate_max_receive, :on => :create
	before_create :debit_chips
	validate :credit_chips
	belongs_to :reciever, class_name: "User", foreign_key: "send_to_id"

	def user_login_token
		user.login_token
	end

	def send_to_token
		reciever.login_token
	end

	def device_avatar_id
		user.device_avatar_id
	end

	def full_name
		[user.first_name, user.last_name].join(" ")
	end

	def image_url
		user.image_url
	end

	private

	def search_requested_friend
		send_to = User.fetch_by_login_token(send_token)
		unless send_to.blank?
			self.send_to_id = send_to.id
		else
			self.errors.add(:base, "1")
		end
	end

	def debit_chips
		if user.chips > 1000
			chips = user.chips - 1000
			self.user.update_attributes(chips: chips)
		else
			self.errors.add(:base, "3")
		end
	end

	def credit_chips
		if self.changes.include?(:confirmed)
			send_to_user = User.where(id: send_to_id).first
			chips = send_to_user.chips + 1000
			send_to_user.update_attributes(chips: chips)
		end
	end

	def valid_request
		if Friendship.where(user_id: user_id, friend_id: send_to_id).blank?
			self.errors.add(:base, "2")
		end
	end

	def send_once
		gift_sent = GiftRequest.where(user_id: user_id, send_to_id: send_to_id).last
		if gift_sent.present?
			if gift_sent.created_at.to_date == Time.now.to_date
				self.errors.add(:base, "4")
			end
		end
	end

	def validate_max_send
		at_begin = Time.now.beginning_of_day
		at_end = at_begin + 1.day
		if user.gift_requests_sent.where("created_at >= ? and created_at <= ?", at_begin, at_end).count() >= 50
			self.errors.add(:base, "5")
		end
	end

	def validate_max_receive
		at_begin = Time.now.beginning_of_day
		at_end = at_begin + 1.day
		if reciever.gift_requests.where("created_at >= ? and created_at <= ?", at_begin, at_end).count >= 50
			self.errors.add(:base, "6")
		end
	end

end
