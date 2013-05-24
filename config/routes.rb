TeachOut::Application.routes.draw do
  
  get "home/index"

  post "students/create"

  get "students/show"

  delete "students/delete"

  post "students/search"

  resources :teachers

  root :to => 'home#index'

  match "teachers/dashboard" => "teacher#show"

end
