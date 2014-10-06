class TableConfigUser < ActiveRecord::Base

	before_create :deactive_previous_preference
	belongs_to :user

	private

	def deactive_previous_preference
		TableConfigUser.where(user_id: user_id, active: true).first.try(:update_attributes, {active: false})
	end

end
