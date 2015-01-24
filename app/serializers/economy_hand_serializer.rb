class EconomyHandSerializer < ActiveModel::Serializer
  attributes :id, :hand_quality, :winner_point, :other_winner_point
end
