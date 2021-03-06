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
		game_moves = self.moves.all
		data.each do |node_obj|
			game_user = game_users.where(user_id: node_obj['playerId']).first
			tournament_users_attributes = []
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
			best_hand_cards = (node_obj['handRank'].to_f > user.best_hand_rank.to_f) ? node_obj['handCards'] : user.best_hand_cards
			user_moves = game_moves.select {|gm| gm.user_id == user.id }
			Tournament.active.each do |tournament|
				tournament_user = TournamentUser.where(tournament_id: tournament.id, user_id: user.id).first
				tournament_users_attributes.push({
	        id: tournament_user.try(:id),
	        user_id: user.id,
	        tournament_id: tournament.id,
	        chips: node_obj['remainingChips'] > game_user.round_chips ? (tournament_user.try(:chips).to_f - game_user.round_chips + node_obj['remainingChips']) : tournament_user.try(:chips).to_f
	      })
			end
			users_attributes.push({
				id: user.id,
				chips: user.chips - game_user.round_chips + node_obj['remainingChips'],
				xp: node_obj['xp'],
				level: node_obj['level'],
				level_percentage: node_obj['levelPercent'],
				biggest_pot: [user.biggest_pot, node_obj['winnerPrize']].max,
				hands_played: (user.hands_played + 1),
				hands_won: (node_obj['isWinner'] ? (user.hands_won + 1) : user.hands_won),
				best_hand_rank: best_hand_rank,
				total_turns: user.total_turns + user_moves.size,
				calls: user.calls + user_moves.select {|um| um.action == "call" }.size,
				folds: user.folds + user_moves.select {|um| um.action == "fold" }.size,
				raises: user.raises + user_moves.select {|um| um.action == "raise" }.size,
				bets: user.bets + user_moves.select {|um| um.action == "bet" }.size,
				checks: user.checks + user_moves.select {|um| um.action == "check" }.size,
				all_ins: user.all_ins + user_moves.select {|um| um.action == "allin" }.size,
				best_hand: best_hand,
				best_hand_cards: best_hand_cards,
				shootout_played: node_obj['isShootout'] ? (user.shootout_played + 1) : user.shootout_played,
				sitandgo_played: node_obj['isSitandgo'] ? (user.sitandgo_played + 1) : user.sitandgo_played,
				shootout_win: (node_obj['shootoutWin'] ? (user.shootout_win + 1) : user.shootout_win),
				sitandgo_win: (node_obj['sitAndGoWin'] ? (user.sitandgo_win + 1) : user.sitandgo_win),
				tournament_users_attributes: tournament_users_attributes
			})
		end
		params[:game_users_attributes] = game_users_attributes
		params[:users_attributes] = users_attributes
		self.update_attributes(params)
	end

end
