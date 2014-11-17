class CreateGameUsers < ActiveRecord::Migration
  def change
    create_table :game_users do |t|
      t.integer :game_id
      t.integer :user_id
      t.string :cards
      t.integer :seat_occcupied_index
      t.boolean :is_waiting

      t.timestamps
    end
  end
end
