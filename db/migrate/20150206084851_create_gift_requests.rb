class CreateGiftRequests < ActiveRecord::Migration
  def change
    create_table :gift_requests do |t|
      t.integer :user_id
      t.integer :send_to_id
      t.string :gift_type
      t.boolean :confirm, default: false
      t.boolean :is_requested, default: false

      t.timestamps
    end
  end
end
