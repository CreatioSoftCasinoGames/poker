class ChangeGiftTypeToGift < ActiveRecord::Migration
  def change
  	remove_column :gift_requests, :gift_type
  	add_column :gift_requests, :gift_coin, :decimal, default: 1000
  end
end
