def create_visitor
  @visitor ||= {email: 'visitor@example.com', password: 'password', password_confirmation: 'password'}
end

def create_user
  @user ||= User.find_by_email(@visitor[:email])
  @user ||= User.create(@visitor)
end

def destroy_user
  User.find_by_email(@visitor[:email]).try(:destroy)
end

Given /^I am a visitor$/ do
  create_visitor
end

Given /^I exist as a user$/ do
  create_user
end

Given /^I do not exist as a user$/ do
  destroy_user
end

When /^I register as a user$/ do
  visit new_user_registration_path
  fill_in 'Email', with: @visitor[:email]
  fill_in 'Password', with: @visitor[:password]
  fill_in 'Password confirmation', with: @visitor[:password]
  click_button I18n.t('button.user.sign_up')
end

When /^I login as a user(?: with an invalid (email|password))?$/ do |field|
  visit new_user_session_path
  fill_in 'Email', with: field == 'email' ? 'invalid@example.com' : @visitor[:email]
  fill_in 'Password', with: field == 'password' ? 'invalidpass' : @visitor[:password]
  click_button I18n.t('button.user.sign_in')
end

When /^I see an? (.*) message$/ do |message|
  key = case message
  when 'successful registration' then 'devise.registrations.signed_up'
  when 'signed in' then 'devise.sessions.signed_in'
  when 'invalid login' then 'devise.failure.invalid'
  end

  page.should have_content I18n.t(key)
end
