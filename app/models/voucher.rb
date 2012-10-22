class Voucher < ActiveRecord::Base
  belongs_to :line_item
  attr_accessible :status, :line_item_id
end
