class Move < ActiveRecord::Base

	belongs_to :game
	belongs_to :user

end