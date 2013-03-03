ElixirFund::Application.routes.draw do
  match 'sitemap.xml' => 'sitemaps#sitemap'

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
          post :update_quantity
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

  resources :partners, :only => [:index, :show]
  resources :patients, :only => [:index, :show, :new, :edit, :create, :update] do
    resource :wishlist do
      resources :wishlist_items, :only => [:destroy, :update, :new, :create]
    end
  end
  resources :products, :only => [:index, :show]
  resource :cart, :only => [:show, :add] do
    member do
      post :add_donation
      delete :remove_donation
    end
  end
  resources :invitations, :only => [:new, :create]
  resources :wishlist_items, :only => [:destroy]
  get '/checkout/billing_info', to: 'checkout#billing_info'
  post '/checkout/process_payment', to: 'checkout#process_payment'
  post '/checkout/process_without_payment', to: 'checkout#process_without_payment'
  get '/checkout/success', to: 'checkout#success'

  get "/cart",        to: 'carts#show',     as: :cart
  put "/cart/add",    to: 'carts#add',      as: :add_to_cart
  put "/cart/add_custom",    to: 'carts#add_custom',      as: :add_to_custom_cart
  put "/cart/remove", to: 'carts#remove',   as: :remove_from_cart
  put "/cart/remove_custom", to: 'carts#remove_custom',   as: :remove_from_custom_cart
  post "/cart/update_quantity", to: 'carts#update_quantity',   as: :update_cart_quantities
  post "/cart/update_quantity_custom", to: 'carts#update_quantity_custom',   as: :update_cart_quantities_custom

  get '/:id', :to => 'pages#show', :as => :pages
end
