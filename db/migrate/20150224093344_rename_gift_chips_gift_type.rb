class RenameGiftChipsGiftType < ActiveRecord::Migration
  def change
  	remove_column :gift_requests, :gift_chips
  	add_column :gift_requests, :gift_type, :string
  end
end
