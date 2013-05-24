TeachOut::Application.routes.draw do
  

  root :to => 'home#index'

  resources :messages, :only => [:new, :create]

  resources :students

  resources :teachers do
    collection do
      get "dashboard"
    end
  end

  resources :sessions, :only => [:new, :create, :destroy]

  resource :search, :only => [:show]


end
