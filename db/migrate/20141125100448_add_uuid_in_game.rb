class AddUuidInGame < ActiveRecord::Migration
  def change
  	add_column :games, :uuid, :string
  end
end
