ActiveAdmin.register Voucher do
	form do |f|
    f.inputs "Details" do
      f.input :line_item
      f.input :status, as: :select, collection: ["Pending", "Redeemed", "Paid", "Cancelled"]
    end
    f.buttons
  end


end
