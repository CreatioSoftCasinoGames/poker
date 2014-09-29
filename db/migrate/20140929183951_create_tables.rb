class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :name
      t.integer :table_config_id

      t.timestamps
    end
  end
end
