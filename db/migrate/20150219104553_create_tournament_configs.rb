class CreateTournamentConfigs < ActiveRecord::Migration
  def change
    create_table :tournament_configs do |t|
      t.date :start_date
      t.date :end_date
      t.boolean :period
      t.decimal :days

      t.timestamps
    end
  end
end
