class CreateRewardAndLevels < ActiveRecord::Migration
  def change
    create_table :reward_and_levels do |t|
      t.decimal :lower_limit
      t.decimal :upper_limit
      t.decimal :reward
      t.string :level

      t.timestamps
    end
  end
end
