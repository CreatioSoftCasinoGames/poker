class AddIsWinnerAndWinnerPrizeInGameUsers < ActiveRecord::Migration
  def change
  	add_column :game_users, :is_winner, :boolean, default: false
  	add_column :game_users, :winner_prize, :decimal
  end
end
