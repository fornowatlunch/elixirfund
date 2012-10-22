def create_products
	puts "Creating Products..."
	60.times do |n|
	  Product.create!(
	    :title => Faker::Company.bs,
	    :description => Faker::Lorem.paragraph,
	    :partner => Partner.order("RANDOM()").first
	  )
	end
end

create_products
