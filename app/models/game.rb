class Game < ActiveRecord::Base

	belongs_to :table
	has_one  :current_user, foreign_key: :current_user_id, class_name: "User"
	has_many :moves
	has_many :game_users
	has_many :users, through: :game_users

	accepts_nested_attributes_for :game_users

end
