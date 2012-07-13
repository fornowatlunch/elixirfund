class Voucher < ActiveRecord::Base
  belongs_to :line_item
  attr_accessible :status
end
