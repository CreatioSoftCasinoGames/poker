class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :table_id
      t.string :round_name
      t.integer :current_user_id
      t.decimal :pot_value
      t.text :deck
      t.active :boolean

      t.timestamps
    end
  end
end
