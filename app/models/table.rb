class Table < ActiveRecord::Base

	belongs_to :table_config
	has_many :table_users
	has_many :users, through: :table_users

end
