class AddLevelPercentage < ActiveRecord::Migration
  def change
  	add_column :users, :level_percentage, :decimal, default: 0
  end
end
