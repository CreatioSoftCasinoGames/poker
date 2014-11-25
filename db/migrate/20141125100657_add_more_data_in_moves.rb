class AddMoreDataInMoves < ActiveRecord::Migration
  def change
  	add_column :moves, :board, :string
		add_column :moves, :round_bets, :string
		add_column :moves, :round_max_bet, :string
		add_column :moves, :pot, :decimal
		add_column :moves, :next_user_id, :integer
  end
end