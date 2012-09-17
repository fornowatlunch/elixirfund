ElixirFund::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :user, :controllers => {:registrations => 'registrations'}, :path => :account, :skip => [:sessions]

  devise_scope :user do
    get 'account', :to => 'registrations#show', :as => :account

    namespace :account do
      resource :wishlist, :only => [:show] do
        member do
          post :add_product
          delete :remove_product
        end
      end
    end
  end

  as :user do
    get   'login'  => 'devise/sessions#new',     :as => :new_user_session
    post  'login'  => 'devise/sessions#create',  :as => :user_session
    match 'logout' => 'devise/sessions#destroy', :as => :destroy_user_session, :via => Devise.mappings[:user].sign_out_via
  end

  root :to => "pages#show", :id => 'home'

  resources :patients, :only => [:index, :show, :new, :edit, :create, :update]
  resources :products, :only => [:index, :show]
  resource :cart, :only => [:show, :update]

  get '/:id', :to => 'pages#show', :as => :pages
end
