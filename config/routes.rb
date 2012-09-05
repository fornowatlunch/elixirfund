ElixirFund::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users

  root :to => "pages#show", :id => 'home'

  resources :patients, :only => [:index, :show]
  resources :products, :only => [:index, :show]
  resource :cart, :only => [:show, :update]

  get '/:id', :to => 'pages#show', :as => :pages
end
