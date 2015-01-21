json.array!(@economy_hands) do |economy_hand|
  json.extract! economy_hand, :id, :hand_quality, :winner_point, :other_winner_point
  json.url economy_hand_url(economy_hand, format: :json)
end
