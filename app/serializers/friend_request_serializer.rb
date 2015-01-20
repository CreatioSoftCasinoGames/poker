class FriendRequestSerializer < ActiveModel::Serializer
	attributes :id, :user_id, :requested_to_id, :status
end