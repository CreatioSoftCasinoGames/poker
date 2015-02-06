class GiftRequest < ActiveRecord::Base

	belongs_to :user
	before_update :update_gift

	private

	def update_gift
		if confirm
			Giftable.create(user_id: self.user_id, send_to_id: self.send_to_id, gift_type: self.gift_type)
			Giftable.create(user_id: self.send_to_id, send_to_id: self.user_id, gift_type: self.gift_type)
		end
	end

end
