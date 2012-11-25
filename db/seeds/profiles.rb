def create_profiles
	puts "Creating User Profiles..."
	User.all.each do |user|
	  p = Patient.create!(
	    :name => Faker::Name.name,
	    :city => Faker::Address.city,
	    :state => Faker::Address.state_abbr,
	    :zip_code => Faker::Address.zip_code,
	    :phone => Faker::PhoneNumber.phone_number,
	    :public_bio => Faker::Lorem.sentence(12),
	    :private_bio => Faker::Lorem.paragraphs(2),
	    :user => user,
	  )
    3.times do 
      @product = Product.order("RANDOM()").first
      p.wishlist.products << @product
    end
	end
end

create_profiles
