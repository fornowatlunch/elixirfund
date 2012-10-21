class CartsController < ApplicationController
	def index
		item_ids = session[:items]
	end

	def add
		removeable_id = params[:product_id]
		session[:items] << "product_#{removeable_id}"
	end

	def remove
		removeable_id = params[:product_id]
		session[:items].delete("product_#{removeable_id}")
	end
end