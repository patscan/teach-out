TeachOut::Application.routes.draw do
  

  root :to => 'home#index'

  resources :messages, :only => [:new, :create]

  resources :students

  resources :teachers

  resources :sessions, :only => [:new, :create, :destroy]

  resource :search, :only => [:show]

  match "teachers/dashboard" => "teacher#show"

end
