class ChangeConfirmToConfirmedInGiftRequests < ActiveRecord::Migration
  def change
  	rename_column :gift_requests, :confirm, :confirmed
  end
end
