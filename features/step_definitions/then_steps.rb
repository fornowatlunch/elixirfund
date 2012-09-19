Then /^I see the login form$/ do
  page.should have_selector('form#new_user')
end

Then /^I dont see the login form$/ do
  page.should_not have_selector('form#new_user')
end

Then /^I am on the (.*) page$/ do |page|
  URI.parse(current_url).path.should == route_path(page)
end

Then /^I am on my account page$/ do
  URI.parse(current_url).path.should == account_path
end

Then /^I am on my wishlist page$/ do
  URI.parse(current_url).path.should == account_wishlist_path
end

Then /^I am on my patient page$/ do
  URI.parse(current_url).path.should == patient_path(@user.patient)
end

Then /^I see the product I selected$/ do
  page.should have_content(@product.title)
end

Then /^I see an? (.*) link$/ do |text|
  link = case text
  when 'sign out' then I18n.t('button.user.sign_out')
  when 'sign in' then I18n.t('button.user.sign_in')
  end
  page.should have_content(link)
end

Then /^I see all the products$/ do
  products = Product.all

  products.each do |product|
    page.should have_content product.title
  end
end

Then /^I see no products$/ do
  page.should have_content I18n.t('messages.no_products_available')
end

Then /^I see the create patient button$/ do
  page.should have_link(I18n.t('label.create_patient'))
end

Then /^I do not see the create patient button$/ do
  page.should_not have_link(I18n.t('label.create_patient'))
end

Then /^I see the new patient form$/ do
  page.should have_css('form#new_patient')
end

Then /^I see my patient information$/ do
  presenter = PatientPresenter.new(@user.patient, nil)
  page.should have_content presenter.name
end

Then /^I see(?: an?)? (.*) message$/ do |message|
  msg = case message
  when 'invitation sent' then I18n.t('flash.create_invitation')
  when 'successful registration' then I18n.t('devise.registrations.signed_up')
  when 'signed in' then I18n.t('devise.sessions.signed_in')
  when 'signed out' then I18n.t('devise.sessions.signed_out')
  when 'invalid login' then I18n.t('devise.failure.invalid')
  when 'already authenticated' then I18n.t('devise.failure.already_authenticated')
  when "patient created" then I18n.t('label.patient_created')
  when /(.*) not saved/ then I18n.t('errors.messages.not_saved.one', resource: $1)
  when /(.*) cant be blank/ then "#{$1.titleize} #{I18n.t('errors.messages.blank')}"
  when /(.*) is invalid/ then "#{$1.titleize} #{I18n.t('errors.messages.invalid')}"
  when /(.*) confirmation/ then "#{$1.titleize} #{I18n.t('errors.messages.confirmation')}"
  when /(.*) too short/ 
    count = case $1
    when 'password' then 8
    end
    "#{$1.titleize} #{I18n.t('errors.messages.too_short', count: count)}"
  when /(.*) too long/
    count = case $1
    when 'password' then 32
    end
    "#{$1.titleize} #{I18n.t('errors.messages.too_long', count: count)}"
  else
    raise 'unknown message'
  end

  page.should have_content msg
end

Then /^I see a link to my patient page$/ do
  page.should have_link(I18n.t('label.view_patient'))
end

Then /^there is a link to my wishlist$/ do
  page.should have_link(I18n.t('label.view_wishlist'))
end

Then /^there is a link to add products$/ do
  page.should have_link(I18n.t('label.add_products'))
end

Then /^there are no products in my wishlist$/ do
  page.should have_content(I18n.t('label.no_products_in_wishlist'))
end

Then /^there is a button to remove the product from my wishlist$/ do
  page.should have_link I18n.t('label.remove_product_from_wishlist')
end

Then /^there is a link to send an invitation$/ do
  page.should have_link I18n.t('label.send_invitation')
end

Then /^the invitee should receive an email$/ do
  unread_emails_for('invitee@example.com').size.should == 1
end
