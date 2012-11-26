class BillingInfo
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :first_name, :last_name, :card_number, :exp_month,
                :exp_year, :cvv
  
  validates_presence_of :first_name, :last_name, :card_number, :exp_month,
                        :exp_year, :cvv
  validates_format_of :card_number, :with => /^[0-9]{16}$/, :message => 'invalid card number'
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def persisted?
    false
  end
end
