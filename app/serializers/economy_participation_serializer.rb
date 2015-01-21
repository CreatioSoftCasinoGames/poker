class EconomyParticipationSerializer < ActiveModel::Serializer
  attributes :id, :lower_limit, :upper_limit, :winner_points, :other_winner_points, :participation_point, :stopper
end
