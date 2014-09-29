json.array!(@table_configs) do |table_config|
  json.extract! table_config, :id, :name, :small_blind, :big_blind, :min_player, :max_player, :min_buy_in, :max_buy_in
  json.url table_config_url(table_config, format: :json)
end
