Then /^I see the login form$/ do
  page.should have_selector('form#new_user')
end

Then /^I dont see the login form$/ do
  page.should_not have_selector('form#new_user')
end

Then /^I am on the (.*) page$/ do |page|
  URI.parse(current_url).path.should == route_path(page)
end

Then /^I see an? (.*) link$/ do |text|
  link = case text
  when 'sign out' then I18n.t('button.user.sign_out')
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
  page.should have_content I18n.t('products.none_available')
end
