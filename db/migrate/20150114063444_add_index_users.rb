class AddIndexUsers < ActiveRecord::Migration
  def change
  	add_index :users, :login_token
  end
end
