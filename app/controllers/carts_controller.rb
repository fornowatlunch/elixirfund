class CartsController < ApplicationController
	def show
		@item_tuples = user_session[:cart_items]
		@items = []
		product_ids = []
		@item_tuples.each do |item_tuple|
			product_ids << item_tuple[1]
		end
		if product_ids
			@items = Product.find(product_ids)
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
		removeable_id = params[:item_id]
		user_session[:items].delete("product_#{removeable_id}")
	end
end