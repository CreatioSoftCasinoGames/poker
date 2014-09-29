class CreateTableUsers < ActiveRecord::Migration
  def change
    create_table :table_users do |t|
      t.integer :table_id
      t.integer :user_id

      t.timestamps
    end
  end
end
