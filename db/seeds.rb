require 'faker'

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
150.times do |n|
  User.create!(
    :email => Faker::Internet.email,
    :password => 'password',
    :password_confirmation => 'password',
  )
end

puts "Creating Connections..."
User.all.each do |user|
  rand(0..6).times do |n|
    Connection.create!(
      :user => user,
      :to_user => User.order("RANDOM()").first.id,
      :can_manage => rand(0..10) > 0 ? 0 : 1,
    )
  end
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
25.times do |n|
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
100.times do |n|
  Product.create!(
    :title => Faker::Company.bs,
    :description => Faker::Lorem.paragraph,
    :partner => Partner.order("RANDOM()").first
  )
end

puts "Creating Orders..."
User.all.each do |u|
  2.times do |n|
    order = Order.create!(
      :subtotal => rand(5..100),
      :status => 'complete',
    )
    rand(1..2).times do |m|
      product = Product.order("RANDOM()").first
      LineItem.create!(
        :order => order,
        :product => product,
        :partner => product.partner,
        :name => product.title,
        :price => product.price,        
      )
    end
  end
end

puts "DONE!"
