ElixirFund::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, :path => :account, :skip => [:sessions]

  as :user do
    get   'login'  => 'devise/sessions#new',     :as => :new_user_session
    post  'login'  => 'devise/sessions#create',  :as => :user_session
    match 'logout' => 'devise/sessions#destroy', :as => :destroy_user_session, :via => Devise.mappings[:user].sign_out_via
  end

  root :to => "pages#show", :id => 'home'

  resources :patients, :only => [:index, :show]
  resources :products, :only => [:index, :show]
  resource :cart, :only => [:show, :update]

  get '/:id', :to => 'pages#show', :as => :pages
end
