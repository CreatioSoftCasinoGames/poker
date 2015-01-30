class ChangeDefaultOfDeviceAvtarId < ActiveRecord::Migration
  def up
  	change_column_default :users, :device_avatar_id, 0
  end
  def down
  	change_column_default :user, :device_avatar_id, nil
  end
end
