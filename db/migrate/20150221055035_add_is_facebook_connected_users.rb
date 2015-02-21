class AddIsFacebookConnectedUsers < ActiveRecord::Migration
  def change
  	add_column :users, :is_facebook_connected, :boolean, default: false
  end
end
