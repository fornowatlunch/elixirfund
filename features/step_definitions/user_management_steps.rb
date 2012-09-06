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
  create_visitor
  create_user
end

Given /^I do not exist as a user$/ do
  destroy_user
end

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
  fill_in 'Email', with: field == 'email' ? 'invalid@example.com' : @visitor[:email]
  fill_in 'Password', with: field == 'password' ? 'invalidpass' : @visitor[:password]
  click_button I18n.t('button.user.sign_in')
end

When /^I see an? (.*) message$/ do |message|
  msg = case message
  when 'successful registration' then I18n.t('devise.registrations.signed_up')
  when 'signed in' then I18n.t('devise.sessions.signed_in')
  when 'signed out' then I18n.t('devise.sessions.signed_out')
  when 'invalid login' then I18n.t('devise.failure.invalid')
  when 'already authenticated' then I18n.t('devise.failure.already_authenticated')
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
  end

  page.should have_content msg
end

Then /^I see the login form$/ do
  page.should have_selector('form#new_user')
end

Then /^I dont see the login form$/ do
  page.should_not have_selector('form#new_user')
end
