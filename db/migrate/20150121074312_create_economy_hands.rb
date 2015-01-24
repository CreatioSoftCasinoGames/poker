class CreateEconomyHands < ActiveRecord::Migration
  def change
    create_table :economy_hands do |t|
      t.string :hand_quality
      t.integer :winner_point
      t.integer :other_winner_point

      t.timestamps
    end
  end
end
