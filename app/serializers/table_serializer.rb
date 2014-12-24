class TableSerializer < ActiveModel::Serializer
  attributes :id, :name, :table_config_id, :game_type
end