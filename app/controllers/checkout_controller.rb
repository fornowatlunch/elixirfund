require 'active_merchant'
class CheckoutController < ApplicationController

  def billing_info
    @billing_info = BillingInfo.new
  end

  def process_without_payment
    o = Order.create user_id: current_user.id, name: current_user.email
    session[:cart_items_custom].each do |item_tuple|
      @wishlist_item = WishlistItem.find(item_tuple[1])
      @line_item = LineItem.new
      @line_item.wishlist_item = @wishlist_item
      @line_item.wishlist_item_name = @wishlist_item.title
      @line_item.patient_id = item_tuple[0]
      @line_item.order_id = o.id
      @line_item.name = @wishlist_item.title
      @line_item.qty = item_tuple[2].to_i
      o.subtotal = 0.0
      o.line_items << @line_item
      o.status = "complete"
      o.save
    end
    email_receipt(o)
    email_custom_item_vouchers(o)

    session[:cart_items_custom] = Set.new
    render 'success'
  end

  def process_payment
    @billing_info = BillingInfo.new(params[:billing_info])

    if !@billing_info.valid?
      flash[:alert] = []
      @billing_info.errors.each do |field, msg|
        flash[:alert] << (t('label.card_' + field.to_s) + ": " + msg)
      end
        render 'billing_info'
      return
    end

    # ActiveMerchant accepts all amounts as Integer values in cents
    amount = 0
    session[:cart_items].each do |item_tuple|
      amount += Product.find(item_tuple[1]).price*item_tuple[2].to_f
    end
    if !session[:donation].nil?
      amount += session[:donation].to_f
    end

    amount = (amount * 100).to_i

    # The card verification value is also known as CVV2, CVC2, or CID
    # @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
    #             :first_name         => params[:billing_info][:first_name],
    #             :last_name          => params[:billing_info][:last_name],
    #             :number             => params[:billing_info][:card_number],
    #             :month              => params[:billing_info][:exp_month],
    #             :year               => params[:billing_info][:exp_year],
    #             :verification_value => params[:billing_info][:cvv])

    if current_user.stripe_id.nil?

      @token = Stripe::Token.create(
        :card => {
          :number => params[:billing_info][:card_number],
          :exp_month => params[:billing_info][:exp_month],
          :exp_year => params[:billing_info][:exp_year],
          :cvc => params[:billing_info][:cvv]
        },
      )

      @customer = Stripe::Customer.create(
        :email => current_user.email, # 'example@stripe.com',
        :card  => @token.id # params[:stripeToken]
      )
      current_user.update_attribute(:stripe_id, @customer.id)
    else
      @customer = Stripe::Customer.retrieve(current_user.stripe_id)
    end

    # Validating the card automatically detects the card type
    begin

      @charge = Stripe::Charge.create(
        :customer    => @customer,
        :amount      => amount,
        :description => 'New Purchase from ElixirFund.org',
        :currency    => 'usd'
      )

      o = Order.create user_id: current_user.id, name: current_user.email, subtotal: amount
      session[:cart_items].each do |item_tuple|
        @product = Product.find(item_tuple[1])
        @line_item = LineItem.new
        @line_item.product = @product
        @line_item.partner = @product.partner
        @line_item.patient_id = item_tuple[0]
        @line_item.order_id = o.id
        @line_item.name = @product.title
        @line_item.qty = item_tuple[2].to_i
        @line_item.price = @product.price
        o.line_items << @line_item
      end

      if !session[:cart_items_custom].blank? && session[:cart_items_custom].size > 0
        session[:cart_items_custom].each do |item_tuple|
          @wishlist_item = WishlistItem.find(item_tuple[1])
          @line_item = LineItem.new
          @line_item.wishlist_item = @wishlist_item
          @line_item.wishlist_item_name = @wishlist_item.title
          @line_item.patient_id = item_tuple[0]
          @line_item.order_id = o.id
          @line_item.name = @wishlist_item.title
          @line_item.qty = item_tuple[2].to_i
          @line_item.price = 0.00
          o.line_items << @line_item
        end
      end

      o.status = "complete"
      o.save

      if !session[:donation].nil?
        @donation = Donation.create order: o, name: current_user.email, amount: session[:donation]
      end

      o.line_items.each do |line_item|
        v = Voucher.create(status: "purchased", line_item_id: line_item.id)
      end

      email_receipt(o)
      email_vouchers(o)

      if !session[:cart_items_custom].blank? && session[:cart_items_custom].size > 0
        email_custom_item_vouchers(o)
        session[:cart_items_custom].each do |item_tuple|
        Wishlist.find_by_patient_id(item_tuple[0]).wishlist_items.find(item_tuple[1]).delete
        end
        session[:cart_items_custom] = Set.new
      end

      session[:cart_items].each do |item_tuple|
        wishlist_item = Wishlist.find_by_patient_id(item_tuple[0]).wishlist_products.find_by_product_id(item_tuple[1])
        requested_quantity = wishlist_item.qty.to_i
        purchased_qty = item_tuple[2].to_i
        qty_remaining = requested_quantity - purchased_qty
        if qty_remaining <= 0
          wishlist_item.delete
        else
          wishlist_item.update_attributes :qty => qty_remaining
        end
      end
      session[:cart_items] = Set.new
      render 'success'
    rescue Stripe::CardError => e
      # CardError; display an error message.
      Rails.logger.info e
      flash[:notice] = 'Card is invalid. Please contact an administrator.'
    rescue => e
      Rails.logger.info e
      abort 'card invalid'
      redirect_to checkout_billing_info_path
    end
  end

  def email_receipt(order)
    OrderMailer.receipt(order).deliver
  end

  def email_vouchers(order)
    order.line_items.each do |line_item|
      if !line_item.product.blank?
        OrderMailer.voucher(line_item).deliver
      end
    end
  end

  def email_custom_item_vouchers(order)
    order.line_items.each do |line_item|
      if !line_item.wishlist_item.blank?
        OrderMailer.custom_item_voucher(line_item).deliver
      end
    end
  end

  private

  def validate_payment_info
    include ActiveModel::Validations
  end
end
