class EconomyRangeSerializer < ActiveModel::Serializer
  attributes :id, :upper_limit, :lower_limit, :level
end
