class CartsController < ApplicationController
	def show
		cart_items = user_session[:cart_items]
		@items = []
		@message = ""
		if cart_items
			cart_items.each do |item_tuple|
				@items << [item_tuple[0], Product.find(item_tuple[1])]
			end
		else
			@message = 'You have no objects in your cart'
		end
	end

	def add
		product_id = params[:product_id]
		patient_id = params[:patient_id]
		tuple = [patient_id.to_i, product_id.to_i].freeze
		user_session[:cart_items] = user_session[:cart_items].add(tuple)
		redirect_to :back
	end

	def remove
		product_id = params[:product_id]
		patient_id = params[:patient_id]
		user_session[:cart_items].delete([patient_id.to_i, product_id.to_i])
		redirect_to cart_path
	end
end