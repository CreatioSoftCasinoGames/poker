class Table < ActiveRecord::Base

	belongs_to :table_config
	has_many :table_users
	has_many :users, through: :table_users
	before_save :set_name

	def game_type
		table_config.game_type
	end

	private

	def set_name
		count = (table_config.tables.last.name.split(" ").last.to_i rescue 0)
		self.name = "#{table_config.try(:name)} #{count+1}"
	end

end
