class OrderMailer < ActionMailer::Base
  default from: "mailer@aktionlab.com"

  def receipt(order)
    @order = order
    mail to: @order.name, subject: I18n.t('email.order_receipt_subject')
  end

  def voucher(line_item)
    @patient = line_item.patient
    @line_item = line_item
    @voucher = Voucher.find_by_line_item_id(line_item.id)
    mail to: @patient.user.email, subject: I18n.t('email.voucher_subject')
  end
 
  def custom_item_voucher(line_item)
    @patient = line_item.patient
    @line_item = line_item
    mail to: @patient.user.email, subject: I18n.t('email.voucher_subject')
  end
end
