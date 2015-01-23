class RenameStatusFriendRequests < ActiveRecord::Migration
  def self.up
  	rename_column :friend_requests, :status, :confirm
  end
  def self.down
  	rename_column :friend_requests, :confirm, :status
  end
end
