class RenameColumnGiftCoinToGiftChips < ActiveRecord::Migration
  def change
  	rename_column :gift_requests, :gift_coin, :gift_chips
  end
end
