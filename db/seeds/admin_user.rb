def create_admin_user
	puts "Creating AdminUser: admin@example.com / password"
	AdminUser.create! :email => 'admin@example.com', :password => 'password', :password_confirmation => 'password'
end

create_admin_user
