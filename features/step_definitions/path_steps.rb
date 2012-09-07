def route_path(path)
  case path
  when 'home' then root_path
  when 'login', 'sign in' then new_user_session_path
  when 'user registration' then new_user_registration_path
  else
    send "#{path.gsub(' ','_')}_path"
  end
end

Then /^I am on the (.*) page$/ do |page|
  URI.parse(current_url).path.should == route_path(page)
end

When /^I visit the (.*) page$/ do |page|
  visit route_path(page)
end

When /^I click the (.*) link$/ do |text|
  link = case text
  when 'sign out' then I18n.t('button.user.sign_out')
  end
  find_link(link).click
end

Then /^I see an? (.*) link$/ do |text|
  link = case text
  when 'sign out' then I18n.t('button.user.sign_out')
  end
  page.should have_content(link)
end

