class OrderMailer < ActionMailer::Base
  default from: "mailer@aktionlab.com"

  def receipt(order)
    @order = order
    mail to: @order.name, subject: "Elixir Fund Giving: Tax-deductible Order Receipt"
  end
end
