class Game < ActiveRecord::Base

	belongs_to :table
	has_one  :current_user, foreign_key: :current_user_id, class_name: "User"
	has_many :moves
	has_many :game_users
	has_many :users, through: :game_users

	accepts_nested_attributes_for :game_users

	def analize(data)
		self.active = false
		self.game_users_attributes = data.collect do |node_obj|
			game_user = game_users.where(user_id: node_obj['playerId']).first
			{
				id: game_user.id,
				is_winner: true,
				winner_prize: node_obj['amount']
			}
		end 
		self.save
	end

end
