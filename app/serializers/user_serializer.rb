class UserSerializer < ActiveModel::Serializer
  attributes :id, :preferred_table_config_id, :email, :device_avatar_id, :full_name
end
