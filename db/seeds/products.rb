def create_products
	puts "Creating Products..."
	30.times do |n|
	  Product.create!(
	    :title => Faker::Company.bs,
	    :description => Faker::Lorem.paragraph,
	    :partner => Partner.order("RANDOM()").first,
	    :price => 74.99,
    )
	end
end

create_products
