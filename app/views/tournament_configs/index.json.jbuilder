json.array!(@tournament_configs) do |tournament_config|
  json.extract! tournament_config, :id, :start_date, :end_date, :period, :days
  json.url tournament_config_url(tournament_config, format: :json)
end
