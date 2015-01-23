class AddShootoutFieldInDatabase < ActiveRecord::Migration
  def change
  	add_column :users, :shootout_level, :integer, default: 1
  	add_column :table_configs, :shootout_level, :integer
  end
end
