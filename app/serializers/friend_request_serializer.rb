class FriendRequestSerializer < ActiveModel::Serializer
	attributes :id, :user_id, :requested_to_id, :confirm, :device_avatar_id, :full_name
end