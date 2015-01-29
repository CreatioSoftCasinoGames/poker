class CreateEconomyRanges < ActiveRecord::Migration
  def change
    create_table :economy_ranges do |t|
      t.decimal :upper_limit
      t.decimal :lower_limit
      t.integer :level

      t.timestamps
    end
  end
end
