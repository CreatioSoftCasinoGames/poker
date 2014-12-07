class AddProfileData < ActiveRecord::Migration
  def change
  	add_column :users, :biggest_pot, :decimal, default: 0
  	add_column :users, :best_hand, :string 
  	add_column :users, :best_hand_rank, :decimal, default: 0
  	add_column :users, :hands_played, :decimal, default: 0
  	add_column :users, :hands_won, :decimal, default: 0 
  	add_column :users, :folds_percent, :decimal, default: 0 
  	add_column :users, :raise_percent, :decimal, default: 0
  	add_column :users, :check_percent, :decimal, default: 0 
  	add_column :users, :bet_percent, :decimal, default: 0
  end
end
