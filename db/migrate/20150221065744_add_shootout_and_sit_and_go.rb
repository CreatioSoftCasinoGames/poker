class AddShootoutAndSitAndGo < ActiveRecord::Migration
  def change
  	add_column :users, :shootout_played, :integer, default: 0
  	add_column :users, :sitandgo_played, :integer, default: 0
  end
end
