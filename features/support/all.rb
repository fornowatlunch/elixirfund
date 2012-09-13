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

def route_path(path)
  case path
  when 'home' then root_path
  when 'login', 'sign in' then new_user_session_path
  when 'user registration' then new_user_registration_path
  else
    send "#{path.gsub(' ','_')}_path"
  end
end

def user_sign_in
  visit new_user_session_path
  fill_in 'Email', with: @visitor[:email]
  fill_in 'Password', with: @visitor[:password]
  click_button I18n.t('button.user.sign_in')
end
