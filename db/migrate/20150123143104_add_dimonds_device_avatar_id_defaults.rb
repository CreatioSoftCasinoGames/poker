class AddDimondsDeviceAvatarIdDefaults < ActiveRecord::Migration
  def up
  	change_column_default :users, :diamonds, 0
  	change_column_default :users, :device_avatar_id, 0
	end

	def down
	  change_column_default :users, :diamonds, nil
	  change_column_default :users, :device_avatar_id, nil
	end
end
