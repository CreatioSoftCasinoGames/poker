json.array!(@economy_ranges) do |economy_range|
  json.extract! economy_range, :id, :upper_limit, :lower_limit, :level
  json.url economy_range_url(economy_range, format: :json)
end
