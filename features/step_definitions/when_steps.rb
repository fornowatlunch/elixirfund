When /^I register(?: with(?: an?)? (.*))?$/ do |error_type|
  creds = @visitor.dup
  case error_type
  when 'no email' then creds[:email] = ''
  when 'invalid email' then creds[:email] = 'invalid.example.com'
  when 'no password' then creds[:password_confirmation] = creds[:password] = ''
  when 'short password' then creds[:password] = creds[:password_confirmation] = 'a'*7
  when 'long password' then creds[:password] = creds[:password_confirmation] = 'a'*33
  when 'blank password confirmation' then creds[:password_confirmation] = ''
  when 'no confirmation' then creds[:password_confirmation] = ''
  end

  fill_in 'Email', with: creds[:email]
  fill_in 'Password', with: creds[:password]
  fill_in 'Password confirmation', with: creds[:password_confirmation]
  click_button I18n.t('button.user.sign_up')
end

When /^I login as a user(?: with an invalid (email|password))?$/ do |field|
  fill_in 'user_email', with: field == 'email' ? 'invalid@example.com' : @visitor[:email]
  fill_in 'user_password', with: field == 'password' ? 'invalidpass' : @visitor[:password]
  click_button I18n.t('button.user.sign_in')
end

When /^I visit the (.*) page$/ do |page|
  visit route_path(page)
end

When /^I visit my account$/ do
  visit account_path
end

When /^I visit my patient page$/ do
  visit patient_path(@user.patient)
end

When /^I click the (.*) link$/ do |text|
  link = case text
  when 'sign out' then I18n.t('button.user.sign_out')
  end
  find_link(link).click
end

When /^I click the create patient profile button$/ do
  find_link(I18n.t('label.create_patient')).click
end

When /^I fill in the patient form$/ do
  patient = FactoryGirl.attributes_for(:patient)
  fill_in "Name", with: patient[:name]
  fill_in "City", with: patient[:city]
  fill_in "State", with: patient[:state]
  fill_in "Zip Code", with: patient[:zip_code]
  fill_in "Phone", with: patient[:phone]
  click_button "Create Patient"
end

When /^I follow the link to my patient page$/ do
  find_link(I18n.t('label.view_patient')).click
end

When /^I follow the link to my wishlist$/ do
  find_link(I18n.t('label.view_wishlist')).click
end

When /^I click the button to add a product$/ do
  find_link(I18n.t('label.add_products')).click
end

When /^I add a product to my wishlist$/ do
  @product = Product.first

  within("ul#product_#{@product.id}") do
    find_link(I18n.t('label.add_to_wishlist')).click
  end
end

When /^I click the button to remove the product from my wishlist$/ do
  product = @user.patient.wishlist.products.first
  
  within("tr#product_#{product.id}") do
    find_link(I18n.t('label.remove_product_from_wishlist')).click
  end
end

When /^I follow the send invitation link$/ do
  find_link(I18n.t('label.send_invitation')).click
end

When /^I send an email invitation$/ do
  within('form#new_invitation') do
    fill_in 'invitation_to', with: 'invitee@example.com'
    fill_in 'invitation_subject', with: 'Subject'
    fill_in 'invitation_message', with: 'Message'
    click_button I18n.t('label.send_invitation')
  end
end
