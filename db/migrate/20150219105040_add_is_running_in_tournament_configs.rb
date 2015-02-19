class AddIsRunningInTournamentConfigs < ActiveRecord::Migration
  def change
  	add_column :tournament_configs, :is_running, :boolean, default: false
  end
end
