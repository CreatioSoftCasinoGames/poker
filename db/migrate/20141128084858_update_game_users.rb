class UpdateGameUsers < ActiveRecord::Migration

  def self.up
  	add_column :game_users, :hand_rank, :decimal
  	add_column :game_users, :hand_message, :string
  	add_column :game_users, :remaining_chips, :decimal
  	add_column :game_users, :round_chips, :decimal
  	remove_column :game_users, :investment
  end

  def self.down
  	remove_column :game_users, :hand_rank
  	remove_column :game_users, :hand_message
  	remove_column :game_users, :remaining_chips
  	remove_column :game_users, :round_chips
  	add_column :game_users, :investment, :decimal
  end

end
