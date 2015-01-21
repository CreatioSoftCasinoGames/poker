json.array!(@economy_participations) do |economy_participation|
  json.extract! economy_participation, :id, :lower_limit, :upper_limit, :winner_points, :other_winner_points, :participation_point, :stopper
  json.url economy_participation_url(economy_participation, format: :json)
end
