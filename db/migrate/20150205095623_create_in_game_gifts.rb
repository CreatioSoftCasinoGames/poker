class CreateInGameGifts < ActiveRecord::Migration
  def change
    create_table :in_game_gifts do |t|
      t.string :name
      t.decimal :cost

      t.timestamps
    end
  end
end
