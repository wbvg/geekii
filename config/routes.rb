Geeky::Application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}


  devise_scope :user do
    get 'register' => 'devise/registrations#new', as: :register
    get 'login' => 'devise/sessions#new', as: :login
    get 'logout' => 'devise/sessions#destroy', as: :logout
  end

  resources :users, :statuses, :about, :statuses, :home, :profiles

  # get 'feed', to: 'statuses#index', as: :feed

  root :to => 'home#index'
  # get '/about' => 'about#index'


end




  # resources :fruits , :only => [:index, :create, :show]

