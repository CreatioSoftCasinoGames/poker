class AddChipsDiamondsAndXpInUsers < ActiveRecord::Migration
  def change
  	add_column :users, :chips 	 , :decimal
  	add_column :users, :xp 			 , :decimal
  	add_column :users, :diamonds , :decimal
  end
end
