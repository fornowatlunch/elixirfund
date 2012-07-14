# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "Removing existing data..."

AdminUser.delete_all
User.delete_all
Profile.delete_all
Connection.delete_all
Partner.delete_all
Product.delete_all
Wishlist.delete_all
WishlistProduct.delete_all
Order.delete_all
LineItem.delete_all
Voucher.delete_all

system("rm -rf #{Rails.root.to_s}/public/uploads")

puts "Creating AdminUser: admin@example.com / password"
AdminUser.create! :email => 'admin@example.com', :password => 'password', :password_confirmation => 'password'

puts "Creating Users..."
5.times do |n|
  User.create!(
    :email => Faker::Internet.email,
    :password => 'password',
    :password_confirmation => 'password',
  )
end

puts "Creating User Profiles..."
User.all.each do |user|
  Profile.create!(
    :name => Faker::Name.name,
    :city => Faker::Address.city,
    :state => Faker::Address.state_abbr,
    :zip_code => Faker::Address.zip_code,
    :phone => Faker::PhoneNumber.phone_number,
    :public_bio => Faker::Lorem.sentence(12),
    :private_bio => Faker::Lorem.paragraphs(2),
    :user => user,
  )
end

puts "Creating Partners..."
5.times do |n|
  Partner.create!(
    :name => Faker::Company.bs,
    :description => Faker::Lorem.paragraph,
    :contact_name => Faker::Name.name,
    :contact_email => Faker::Internet.email,
    :address1 => Faker::Address.street_address,
    :city => Faker::Address.city,
    :state => Faker::Address.state_abbr,
    :zip_code => Faker::Address.zip_code,
    :phone => Faker::PhoneNumber.phone_number,
    :fax => Faker::PhoneNumber.phone_number,
  )
end

puts "Creating Wishlists..."
User.all.each do |user|
  Wishlist.create!(
    :title => 'My Wishlist',
    :description => Faker::Lorem.sentence(10),
    :user => user,
  )
end

puts "Creating Products..."
20.times do |n|
  Product.create!(
    :title => Faker::Company.bs,
    :description => Faker::Lorem.paragraph,
  )
end

puts "DONE!"
