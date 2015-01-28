class AddDefaultUserXp < ActiveRecord::Migration
	def up
  	change_column_default :users, :xp, 0
	end

	def down
	  change_column_default :users, :xp, nil
	end
end
