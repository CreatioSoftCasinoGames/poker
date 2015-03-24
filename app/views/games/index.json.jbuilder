json.array!(@rooms) do |room|
  json.extract! room, :id, :name, :min_stake, :max_stake, :min_buy_in, :max_buy_in, :max_players
  json.url room_url(room, format: :json)
end
