class AddGameTypeInTables < ActiveRecord::Migration
  def change
  	add_column :table_configs, :game_type, :string
  end
end
