class Giftable < ActiveRecord::Base

	belongs_to :user
	belongs_to :gifts, class_name: "User", foreign_key: :send_to_id

end
