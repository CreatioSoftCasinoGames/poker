class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :action
      t.integer :user_id
      t.decimal :remaining_chips
      t.decimal :bet_amount
      t.integer :game_id

      t.timestamps
    end
  end
end
