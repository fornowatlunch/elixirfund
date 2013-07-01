def create_users
	puts "Creating Users..."
	10.times do |n|
	  User.create!(
	    :email => Faker::Internet.email,
	    :password => 'password',
	    :password_confirmation => 'password',
	  )
	end
end

create_users
