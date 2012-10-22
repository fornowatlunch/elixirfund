def create_connections
	puts "Creating Connections..."
	User.all.each do |user|
	  rand(0..6).times do |n|
	    Connection.create!(
	      :user => user,
	      :to_user => User.order("RANDOM()").first.id,
	      :can_manage => rand(0..10) > 0 ? 0 : 1,
	    )
	  end
	end
end

create_connections
