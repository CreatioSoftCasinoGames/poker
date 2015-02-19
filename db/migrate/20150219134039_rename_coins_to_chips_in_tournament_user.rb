class RenameCoinsToChipsInTournamentUser < ActiveRecord::Migration
  def change
  	rename_column :tournament_users, :coins, :chips
  end
end
