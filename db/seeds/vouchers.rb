def vouchers
	puts "Creating Vouchers..."
	LineItem.limit(15).each do |item|
		Voucher.create!(
			line_item_id: item.id,
			status: 			"pending"
		)
	end
end

vouchers
