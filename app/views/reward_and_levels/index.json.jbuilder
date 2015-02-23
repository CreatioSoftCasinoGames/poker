json.array!(@reward_and_levels) do |reward_and_level|
  json.extract! reward_and_level, :id, :lower_limit, :upper_limit, :reward, :level
  json.url reward_and_level_url(reward_and_level, format: :json)
end
