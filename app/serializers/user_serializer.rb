class UserSerializer < ActiveModel::Serializer
  attributes  :id, 
              :login_token,
  						:preferred_table_config_id, 
  						:email, 
  						:device_avatar_id, 
  						:full_name,
              :fb_id,
  						:chips,
  						:player_since,
  						:biggest_pot,
  						:best_hand,
              :best_hand_cards,
  						:hands_played,
  						:hands_won,
  						:folds_percent,
  						:checks_percent,
              :calls_percent,
  						:bets_percent,
              :shootout_level,
              :diamonds,
              :xp,
              :level,
              :level_percentage,
              :shootout_win,
              :sitandgo_win,
              :num_friend_request,
              :num_gift_request,
              :is_friend,
              :is_requested
end
