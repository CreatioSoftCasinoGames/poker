class FriendshipSerializer < ActiveModel::Serializer
	attributes :user_id, :friend_id, :full_name, :device_avtar_id
end