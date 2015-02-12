class AddFieldUsers < ActiveRecord::Migration
  def change
  	add_column :users, :num_friend_request, :integer, default: 0
  	add_column :users, :num_gift_request, :integer, default: 0
  end
end
