class AddColumnTournamentUsers < ActiveRecord::Migration
  def change
  	add_column :tournament_users, :rank, :integer, default: 0
  end
end
