class EconomyBetSerializer < ActiveModel::Serializer
  attributes :id, :lower_limit, :upper_limit, :points
end
