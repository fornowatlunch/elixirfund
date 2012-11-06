require 'active_merchant'
class CheckoutController < ApplicationController

  def billing_info
    @billing_info = BillingInfo.new
  end
  
  def process_payment
    @payment_info = BillingInfo.new(params[:billing_info])
    
    if !@payment_info.valid?
      abort @payment_info.errors.inspect 
    end

    # ActiveMerchant accepts all amounts as Integer values in cents
    amount = 1000  # $10.00

    # The card verification value is also known as CVV2, CVC2, or CID 
    credit_card = ActiveMerchant::Billing::CreditCard.new(
                :first_name         => params[:first_name],
                :last_name          => params[:last_name],
                :number             => params[:card_number],
                :month              => params[:exp_month],
                :year               => params[:exp_year],
                :verification_value => params[:cvv])

    # Validating the card automatically detects the card type
    if credit_card.valid?
      # Capture $10 from the credit card
      response = GATEWAY.purchase(amount, credit_card)

      if response.success?
        puts "Successfully charged $#{sprintf("%.2f", amount / 100)} to the credit card #{credit_card.display_number}"
      else
        raise StandardError, response.message 
      end
    end
    render 'success', locals: {billing_info: @billing_info}
    #redirect_to checkout_success_path
  end

  def success

  end

  private

  def validate_payment_info
    include ActiveModel::Validations  
  end
end
