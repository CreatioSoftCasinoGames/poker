class TournamentConfig < ActiveRecord::Base

	has_many :tournaments
	scope :have_no_games, -> {where(is_running: false)}
	accepts_nested_attributes_for :tournaments

	def self.generate_tournaments
		Tournament.active.where(end_date: Date.today).each do |tournament|
			tournament.update_attributes({active: false})
		end
		self.have_no_games.where(start_date: Date.today).each do |tournament_config|
			end_date = (tournament_config.period ? (Date.today + tournament_config.days.days) : tournament_config.end_date)
			tournament_config.attributes = {is_running: true, tournaments_attributes: [{start_date: Date.today, end_date: end_date, active: true}]}
			tournament_config.save
		end
	end

end
