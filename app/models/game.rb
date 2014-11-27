class Game < ActiveRecord::Base

	belongs_to :table
	has_one  :current_user, foreign_key: :current_user_id, class_name: "User"
	has_many :moves
	has_many :game_users
	has_many :users, through: :game_users

	accepts_nested_attributes_for :game_users
	accepts_nested_attributes_for :users

	def analize(data)
		# self.active = false
		# self.game_users_attributes = 
		# self.game_users.each do |game_user|
		# 	if game_user.user_id == node_obj['playerId'].to_i
				
		# 	else
		# 	end
		# end
		# data.collect do |node_obj|
		# 	game_user = game_users.where(user_id: ).first
		# 	{
		# 		id: game_user.id,
		# 		is_winner: true,
		# 		winner_prize: node_obj['amount']
		# 	}
		# end
		# self.users_attributes = self.game_users.collect do |game_user|
		# 	user = game_user.user
		# 	{
		# 		id: user.id,
		# 		chips: user.chips + game_user.winner_prize.to_f
		# 	}
		# end
		# self.save
	end

end
