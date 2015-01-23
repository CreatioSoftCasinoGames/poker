class Friendship < ActiveRecord::Base
	belongs_to :user
	belongs_to :friends, class_name: "User", foreign_key: :friend_id
end