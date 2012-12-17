require 'active_merchant'
class CheckoutController < ApplicationController

  def billing_info
    @billing_info = BillingInfo.new
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
      amount += Product.find(item_tuple[1]).price
    end
        
    
    # The card verification value is also known as CVV2, CVC2, or CID 
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
                :first_name         => params[:billing_info][:first_name],
                :last_name          => params[:billing_info][:last_name],
                :number             => params[:billing_info][:card_number],
                :month              => params[:billing_info][:exp_month],
                :year               => params[:billing_info][:exp_year],
                :verification_value => params[:billing_info][:cvv])

    # Validating the card automatically detects the card type
    if @credit_card.valid? 
      # Capture $10 from the credit card
      response = GATEWAY.purchase((amount * 100).round, @credit_card)

      if response.success?
        o = Order.create user_id: current_user.id, name: current_user.email, subtotal: amount
        session[:cart_items].each do |item_tuple|
          @product = Product.find(item_tuple[1])
          @line_item = LineItem.new
          @line_item.product = @product
          @line_item.partner = @product.partner
          @line_item.patient_id = item_tuple[0]
          @line_item.order_id = o.id
          @line_item.name = @product.title
          @line_item.price = @product.price
          o.line_items << @line_item
          o.status = "complete"
          o.save
        end
    
        o.line_items.each do |line_item|
          v = Voucher.create(status: "purchased", line_item_id: line_item.id)
        end

        email_receipt(o)
        email_vouchers(o)

        session[:cart_items] = []
        render 'success'
      else
        raise StandardError, response.message 
      end
    else
      abort 'card invalid'
      redirect_to checkout_billing_info_path 
    end
  end

  def email_receipt(order)
    OrderMailer.receipt(order).deliver
  end

  def email_vouchers(order)
    order.line_items.each do |line_item|
      OrderMailer.voucher(line_item).deliver
    end
  end

  private

  def validate_payment_info
    include ActiveModel::Validations  
  end
end
