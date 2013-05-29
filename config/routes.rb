TeachOut::Application.routes.draw do
  
  root :to => 'home#index'

  match "message/status" => "messagestatus#create"
  
  resources :messages do
    collection do
      get "schedule_new"
      post "schedule"
    end
  end

  resources :students

  resources :teachers do
    collection do
      get "dashboard"
      get "render_calendar"
    end
  end

  resources :sessions, :only => [:new, :create, :destroy]

  resource :search, :only => [:show]


end
