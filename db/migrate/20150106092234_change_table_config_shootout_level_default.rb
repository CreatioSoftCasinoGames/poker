class ChangeTableConfigShootoutLevelDefault < ActiveRecord::Migration
	def up
  	change_column_default :table_configs, :shootout_level, 0
	end

	def down
	  change_column_default :table_configs, :shootout_level, nil
	end
end
