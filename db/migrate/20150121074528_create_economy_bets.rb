class CreateEconomyBets < ActiveRecord::Migration
  def change
    create_table :economy_bets do |t|
      t.decimal :lower_limit
      t.decimal :upper_limit
      t.integer :points

      t.timestamps
    end
  end
end
