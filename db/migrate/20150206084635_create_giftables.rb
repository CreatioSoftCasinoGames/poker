class CreateGiftables < ActiveRecord::Migration
  def change
    create_table :giftables do |t|
      t.integer :user_id
      t.integer :send_to_id
      t.string :gift_type

      t.timestamps
    end
  end
end
