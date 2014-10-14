class Table < ActiveRecord::Base

	belongs_to :table_config
	has_many :table_users
	has_many :users, through: :table_users
	before_save :set_name

	private

	def set_name
		count = (table_config.tables.last.name.split(" ").last.to_i rescue 0)
		self.name = "#{table_config.name} #{count+1}"
	end

end
