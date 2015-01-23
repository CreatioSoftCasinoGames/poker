class CreateFriendRequests < ActiveRecord::Migration
  def change
    create_table :friend_requests do |t|
    	t.integer :user_id
    	t.integer :requested_to
    	t.integer :status, default: 0
    end
  end
end
