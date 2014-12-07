class UserSerializer < ActiveModel::Serializer
  attributes  :id, 
  						:preferred_table_config_id, 
  						:email, 
  						:device_avatar_id, 
  						:full_name, 
  						:avatar, 
  						:chips,
  						:player_since,
  						:biggest_pot,
  						:best_hand,
  						:hands_played,
  						:hands_won,
  						:folds_percent,
  						:raise_percent,
  						:check_percent,
  						:bet_percent
end
