class DropGiftable < ActiveRecord::Migration
  def change
  	drop_table :giftables
  end
end
