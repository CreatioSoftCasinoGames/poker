class FriendRequestSerializer < ActiveModel::Serializer
	attributes :user_id, :requested_to, :status
end