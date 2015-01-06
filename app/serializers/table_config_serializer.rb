class TableConfigSerializer < ActiveModel::Serializer
  attributes :id, :name, :small_blind, :big_blind, :min_player, :max_player, :min_buy_in, :max_buy_in, :game_type, :fee, :pot, :shootout_level
  has_many :tables
end
