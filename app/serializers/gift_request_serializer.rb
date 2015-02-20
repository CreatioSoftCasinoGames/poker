class GiftRequestSerializer < ActiveModel::Serializer
	attributes :id,
	           :user_login_token,
	           :send_to_token,
	           :full_name,
	           :device_avatar_id,
	           :confirmed
end