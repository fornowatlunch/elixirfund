class Partner < ActiveRecord::Base 
  attr_accessible :address1, :address2, :city, :state, :zip_code, :contact_email, :contact_name, :description, :fax, :image, :name, :phone
  
  mount_uploader :image, LogoUploader

  def formatted_address
    "#{self.address1}<br />#{self.city}, #{self.state} #{self.zip_code}".html_safe 
  end
  
end
