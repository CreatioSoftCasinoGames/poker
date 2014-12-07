class Game < ActiveRecord::Base

	belongs_to :table
	has_one  :current_user, foreign_key: :current_user_id, class_name: "User"
	has_many :moves
	has_many :game_users
	has_many :users, through: :game_users

	accepts_nested_attributes_for :game_users
	accepts_nested_attributes_for :users

	def analize(data)
		params = {active: false}
		game_users_attributes = []
		users_attributes = []

		data.each do |node_obj|
			game_user = game_users.where(user_id: node_obj['playerId']).first
			user = game_user.user
			game_users_attributes.push({
				id: game_user.id,
				is_winner: node_obj['isWinner'],
				winner_prize: node_obj['winnerPrize'],
				hand_rank: node_obj['handRank'],
				hand_message: node_obj['handMessage'],
				remaining_chips: node_obj['remainingChips']
			})
			best_hand_rank = (node_obj['handRank'].to_f > user.best_hand_rank.to_f) ? node_obj['handRank'] : user.best_hand_rank
			best_hand = (node_obj['handRank'].to_f > user.best_hand_rank.to_f) ? node_obj['handMessage'] : user.best_hand
			users_attributes.push({
				id: user.id,
				chips: user.chips - game_user.round_chips + node_obj['remainingChips'],
				biggest_pot: [user.biggest_pot, node_obj['winnerPrize']].max,
				hands_played: (user.hands_played + 1),
				hands_won: (node_obj['isWinner'] ? (user.hands_won + 1) : user.hands_won),
				best_hand_rank: best_hand_rank,
				best_hand: best_hand
			})
		end
		params[:game_users_attributes] = game_users_attributes
		params[:users_attributes] = users_attributes
		self.update_attributes(params)
	end

end
