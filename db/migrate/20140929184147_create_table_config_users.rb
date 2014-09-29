class CreateTableConfigUsers < ActiveRecord::Migration
  def change
    create_table :table_config_users do |t|
      t.integer :table_config_id
      t.integer :user_id
      t.boolean :active

      t.timestamps
    end
  end
end
