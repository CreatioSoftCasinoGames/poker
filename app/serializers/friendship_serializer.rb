class FriendshipSerializer < ActiveModel::Serializer
	attributes :user_id, :friend_id
end