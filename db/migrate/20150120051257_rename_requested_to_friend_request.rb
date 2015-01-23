class RenameRequestedToFriendRequest < ActiveRecord::Migration
  def change
  	rename_column :friend_requests, :requested_to, :requested_to_id
  	reversible do |dir|
  		change_table :friend_requests do |t|
  			dir.up {
  				t.change :status, :boolean
  			}
  			dir.down{
  				t.change :status, :integer
  			}
  		end
  	end
  end
end
