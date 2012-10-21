Given /^I am a visitor$/ do
  create_visitor
end

Given /^I am logged in as a user$/ do
  create_visitor
  create_user
  user_sign_in
end

Given /^I am logged in as a patient$/ do
  create_visitor
  create_user
  user_sign_in

  @user.create_patient!(FactoryGirl.attributes_for(:patient))
end

Given /^I exist as a user$/ do
  create_visitor
  create_user
end

Given /^I do not exist as a user$/ do
  destroy_user
end

Given /^I have a partner with (\d+) products$/ do |count|
  partner = FactoryGirl.create(:partner)
  count.to_i.times { FactoryGirl.create(:product, :partner => partner) }
end

Given /^there are products$/ do
  FactoryGirl.create_list(:product, 5)
end

Given /^I have a product in my wishlist$/ do
  @user.patient.wishlist.products << Product.first
end

Given /^I visit a patient profile$/ do
  # find the patient based on the first product
  patient = Patient.find(Wishlist.find(WishlistProduct.first.wishlist_id).patient_id)
  visit patient_path
end

