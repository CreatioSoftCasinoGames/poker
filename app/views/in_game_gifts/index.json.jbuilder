json.array!(@in_game_gifts) do |in_game_gift|
  json.extract! in_game_gift, :id, :name, :cost
  json.url in_game_gift_url(in_game_gift, format: :json)
end
