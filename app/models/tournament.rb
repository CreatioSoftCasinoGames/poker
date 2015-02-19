class Tournament < ActiveRecord::Base

	belongs_to :tournament_config
	scope :active, -> {where(active: true)}
	before_update :update_config

	private

	def update_config
		if self.changes.include?(:active) && !active
			self.tournament_config.is_running = false
		end
	end

end
