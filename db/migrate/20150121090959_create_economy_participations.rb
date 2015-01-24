class CreateEconomyParticipations < ActiveRecord::Migration
  def change
    create_table :economy_participations do |t|
      t.decimal :lower_limit
      t.decimal :upper_limit
      t.integer :winner_points
      t.integer :other_winner_points
      t.integer :participation_point
      t.integer :stopper

      t.timestamps
    end
  end
end
