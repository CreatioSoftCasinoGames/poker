class TournamentUserSerializer < ActiveModel::Serializer
	attributes :id, :chips, :full_name, :image_url
end