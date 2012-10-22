def create_orders
	puts "Creating Orders..."
	User.all.each do |u|
	  2.times do |n|
	    order = Order.create!(
	      :subtotal => rand(5..100),
	      :status => 'complete',
	    )
	    rand(1..2).times do |m|
	      product = Product.order("RANDOM()").first
	      LineItem.create!(
	        :order => order,
	        :product => product,
	        :partner => product.partner,
	        :name => product.title,
	        :price => product.price,        
	      )
	    end
	  end
	end
end

create_orders
