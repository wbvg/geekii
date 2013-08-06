Geeky::Application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  devise_scope :user do
    get 'register' => 'devise/registrations#new', as: :register
    get 'login' => 'devise/sessions#new', as: :login
    get 'logout' => 'devise/sessions#destroy', as: :logout
  end

  resources :about, :home, :profiles
  resources :statuses
  resources :users

  # get '/statuses/:id' => 'statuses#show', :as => 'status'
  # post'/statuses/:id/delete' => 'statuses#destroy', :as => 'status_delete'
  # get '/statuses/:id/edit' => 'statuses#edit', :as => 'status_edit'
  # post '/statuses/:id' => 'statuses#update'

  # get 'feed', to: 'statuses#index', as: :feed

  root :to => 'home#index'

end

