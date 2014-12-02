class AddDeviceAvatarIdToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :device_avatar_id, :integer
  end
end
