Geeky::Application.routes.draw do
  devise_for :users

  devise_scope :user do
    get 'register' => 'devise/registrations#new', as: :register
    get 'login' => 'devise/sessions#new', as: :login
    get 'logout' => 'devise/sessions#destroy', as: :logout
  end

  resources :statuses, :about

  get 'feed', to: 'statuses#index', as: :feed

  root :to => 'home#index'
  # get '/about' => 'about#index'


end




  # resources :fruits , :only => [:index, :create, :show]

