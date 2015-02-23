class TournamentUserSerializer < ActiveModel::Serializer
	attributes :id, :chips, :full_name, :device_avatar_id, :image_url, :reward, :level
end