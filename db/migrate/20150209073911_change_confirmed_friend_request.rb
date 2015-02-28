class ChangeConfirmedFriendRequest < ActiveRecord::Migration
  def change
  	rename_column :friend_requests, :confirm, :confirmed
  end
end
