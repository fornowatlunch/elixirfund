def create_partners
	puts "Creating Partners..."
	50.times do |n|
	  Partner.create!(
	    :name => Faker::Company.bs,
	    :description => Faker::Lorem.paragraph,
	    :contact_name => Faker::Name.name,
	    :contact_email => Faker::Internet.email,
	    :address1 => Faker::Address.street_address,
	    :city => Faker::Address.city,
	    :state => Faker::Address.state_abbr,
	    :zip_code => Faker::Address.zip_code,
	    :phone => Faker::PhoneNumber.phone_number,
	    :fax => Faker::PhoneNumber.phone_number,
	  )
	end
end

create_partners
