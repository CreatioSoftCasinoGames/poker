class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.integer :tournament_config_id
      t.date :start_date
      t.date :end_date
      t.boolean :active

      t.timestamps
    end
  end
end
