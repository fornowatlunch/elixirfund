require 'faker'

puts "Removing existing data..."

AdminUser.delete_all
User.delete_all
Patient.delete_all
Connection.delete_all
Partner.delete_all
Product.delete_all
Wishlist.delete_all
WishlistProduct.delete_all
Order.delete_all
LineItem.delete_all
Voucher.delete_all

system("rm -rf #{Rails.root.to_s}/public/uploads")

path = "#{Rails.root.to_s}/db/seeds"

require "#{path}/admin_user.rb"
require "#{path}/users.rb"
require "#{path}/connections.rb"
require "#{path}/partners.rb"
require "#{path}/products.rb"
require "#{path}/profiles.rb"
require "#{path}/orders.rb"
require "#{path}/vouchers.rb"

puts "DONE!"
