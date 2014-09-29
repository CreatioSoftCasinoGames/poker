class TableConfig < ActiveRecord::Base

	has_many :tables
	has_many :table_config_users
	has_many :users, through: :table_config_users

end
