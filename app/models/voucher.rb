class Voucher < ActiveRecord::Base
  belongs_to :line_item
  attr_accessible :status, :line_item_id
  before_create :generate_redeem_code

  def generate_redeem_code
  	self.code = SecureRandom.uuid.to_s[0..5]
  end
end
