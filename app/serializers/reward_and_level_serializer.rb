class RewardAndLevelSerializer < ActiveModel::Serializer
  attributes :id, :lower_limit, :upper_limit, :reward, :level
end
