Geeky::Application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  devise_scope :user do
    get 'register' => 'devise/registrations#new', as: :register
    get 'login' => 'devise/sessions#new', as: :login
    get 'logout' => 'devise/sessions#destroy', as: :logout
  end

  resources :about, :home, :statuses, :users


  resources :profiles, :only => [:index, :new, :create] do
    collection do
      get '/chart/:chapter', :action => 'chart'
    end
  end

  root :to => 'home#index'

end

