class GameUser < ActiveRecord::Base

	belongs_to :game
	belongs_to :user

	def moves
		game.moves.where(moves: {user_id: user_id})
	end

end
