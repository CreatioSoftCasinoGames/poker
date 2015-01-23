json.array!(@economy_bets) do |economy_bet|
  json.extract! economy_bet, :id, :lower_limit, :upper_limit, :points
  json.url economy_bet_url(economy_bet, format: :json)
end
