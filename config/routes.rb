TeachOut::Application.routes.draw do
  
  get "home/index"

  # post "students/create"
  # get "students/show"
  # delete "students/delete"
  # post "students/search"

  resources :students

  resources :teachers
  
  resources :sessions, :only => [:new, :create, :destroy]

  root :to => 'home#index'

  match "teachers/dashboard" => "teacher#show"

end
