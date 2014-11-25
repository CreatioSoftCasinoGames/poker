class Move < ActiveRecord::Base

	belongs_to :game
	belongs_to :user
	attr_accessor :game_uuid

	before_create :assign_game

	private 

	def assign_game
		p game_uuid
		self.game_id = Game.where(uuid: game_uuid).first.id
	end

end