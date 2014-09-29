class CreateTableConfigs < ActiveRecord::Migration
  def change
    create_table :table_configs do |t|
      t.string :name
      t.decimal :small_blind
      t.decimal :big_blind
      t.integer :min_player
      t.integer :max_player
      t.decimal :min_buy_in
      t.decimal :max_buy_in

      t.timestamps
    end
  end
end
