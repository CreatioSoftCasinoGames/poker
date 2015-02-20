class FriendRequestSerializer < ActiveModel::Serializer
	attributes :id,
						 :user_login_token, 
						 :requested_to_token, 
						 :confirmed, 
						 :device_avatar_id, 
						 :full_name,
						 :image_url
end