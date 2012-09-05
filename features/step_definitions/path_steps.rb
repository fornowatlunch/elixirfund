def route_path(path)
  case path
  when 'home' then root_path
  when 'login' then new_user_session_path
  when 'user registration' then new_user_registration_path
  else
    send "#{page.gsub(' ','_')}_path"
  end
end

Then /^I am on the (.*) page$/ do |page|
  URI.parse(current_url).path.should == route_path(page)
end

When /^I visit the (.*) page$/ do |page|
  visit route_path(page)
end

