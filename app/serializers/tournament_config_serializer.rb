class TournamentConfigSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date, :period, :days
end
