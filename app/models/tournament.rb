class Tournament < ActiveRecord::Base

	belongs_to :tournament_config
	scope :active, -> {where(active: true)}
	before_update :update_config
	has_many :tournament_users, :dependent => :destroy

	private

	def update_config
		if self.changes.include?(:active) && !active
			if self.tournament_config.period
				@start_date = self.tournament_config.start_date + self.tournament_config.days
			end
			self.tournament_config.update_attributes(is_running: false, start_date: @start_date)
		end
		true
	end

end
