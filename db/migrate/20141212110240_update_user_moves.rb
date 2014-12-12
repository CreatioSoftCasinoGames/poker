class UpdateUserMoves < ActiveRecord::Migration

  def self.up
  	add_column 	  :users, :total_turns, :decimal, default: 0
  	add_column 	  :users, :all_ins, :decimal, default: 0
    add_column    :users, :calls, :decimal, default: 0
  	rename_column :users, :folds_percent, :folds
  	rename_column :users, :raise_percent, :raises
  	rename_column :users, :check_percent, :checks
  	rename_column :users, :bet_percent, :bets
  end

  def self.down
  	remove_column :users, :total_turns
  	remove_column :users, :all_ins
    remove_column :users, :calls
  	rename_column :users, :folds, :folds_percent
  	rename_column :users, :raises, :raise_percent
  	rename_column :users, :checks, :check_percent
  	rename_column :users, :bets, :bet_percent
  end

end
