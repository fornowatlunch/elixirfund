class CartsController < ApplicationController
	def show
		cart_items = session[:cart_items]
		@items = []
		@message = ""
		if cart_items
			cart_items.each do |item_tuple|
				@items << [item_tuple[0], Product.find(item_tuple[1]), item_tuple[2]]
			end
		else
			@message = 'You have no items in your cart'
		end
	end

	def add
		product_id = params[:product_id]
		patient_id = params[:patient_id]
		tuple = [patient_id.to_i, product_id.to_i, 1].freeze
		unless session[:cart_items]
			session[:cart_items] = Set.new
		end
		session[:cart_items] = session[:cart_items].add(tuple)
		redirect_to :back
	end

	def remove
		product_id = params[:product_id]
		patient_id = params[:patient_id]
		session[:cart_items].delete([patient_id.to_i, product_id.to_i])
		redirect_to :back
	end

  def update_quantity
    session[:cart_items].each_with_index do |item, i|
      item[2] = params[:quantities][i]
    end
    redirect_to :back
  end

  def add_donation
    if session[:donation].nil?
      session[:donation] = params[:donation].to_f
    else
      session[:donation] += params[:donation].to_f
    end
    redirect_to :back
  end

  def remove_donation
    session[:donation] = nil
    redirect_to :back
  end
end
